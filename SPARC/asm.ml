(* SPARC assembly with a few virtual instructions *)

type id_or_imm = V of Id.t | C of int
type t = (* ̿������ (caml2html: sparcasm_t) *)
  | Ans of exp
  | Let of (Id.t * Type.t) * exp * t
and exp = (* ���İ��Ĥ�̿�����б����뼰 (caml2html: sparcasm_exp) *)
  | Nop
  | Set of int (*Int��Store*)
  | SetL of Id.l (*Float��Store*)
  | Mov of Id.t (*Int��Move,�ǽ�Ū��Addi 0*)
  | Neg of Id.t (**)
  | Add of Id.t * id_or_imm (*Int��Add*)
  | Sub of Id.t * id_or_imm (*Int��Sub*)
  | Mul of Id.t * id_or_imm
  | Div of Id.t * id_or_imm
  | SLL of Id.t * id_or_imm (*Shift left logical*)
  | Ld of Id.t * id_or_imm (*Int��Load*)
  | St of Id.t * Id.t * id_or_imm (**)
  | FMovD of Id.t
  | FNegD of Id.t
  | FAddD of Id.t * Id.t
  | FSubD of Id.t * Id.t
  | FMulD of Id.t * Id.t
  | FDivD of Id.t * Id.t
  | FFloor of Id.t
  | FSqrt of Id.t
  | FAbs of Id.t
  | Ftoi of Id.t
  | Itof of Id.t
  | Read_int of unit
  | Read_float of unit
  | Print_int of Id.t
  | Print_char of Id.t
  | LdDF of Id.t * id_or_imm
  | StDF of Id.t * Id.t * id_or_imm
  | Comment of string
  (* virtual instructions *)
  | IfEq of Id.t * id_or_imm * t * t
  | IfLE of Id.t * id_or_imm * t * t
  | IfGE of Id.t * id_or_imm * t * t (* �����оΤǤϤʤ��Τ�ɬ�� *)
  | IfFEq of Id.t * Id.t * t * t
  | IfFLE of Id.t * Id.t * t * t
  (* closure address, integer arguments, and float arguments *)
  | CallCls of Id.t * Id.t list * Id.t list
  | CallDir of Id.l * Id.t list * Id.t list
  | Save of Id.t * Id.t (* �쥸�����ѿ����ͤ򥹥��å��ѿ�����¸ (caml2html: sparcasm_save) *)
  | Restore of Id.t * Type.t (* �����å��ѿ������ͤ����� (caml2html: sparcasm_restore) *)
type fundef = { name : Id.l; args : Id.t list; fargs : Id.t list; body : t; ret : Type.t }
(* �ץ����������� = ��ư���������ơ��֥� + �ȥåץ��٥��ؿ� + �ᥤ���μ� (caml2html: sparcasm_prog) *)
type prog = Prog of (Id.l * float) list * fundef list * t

let fletd(x, e1, e2) = Let((x, Type.Float), e1, e2)
let seq(e1, e2) = Let((Id.gentmp Type.Unit, Type.Unit), e1, e2)

let regs = (* Array.init 16 (fun i -> Printf.sprintf "%%r%d" i) *)(*26個*)
  [| "$v0"; "$v1"; "$a0"; "$a1";
     "$a2"; "$a3"; "$t0"; "$t1"; "$t2"; "$t3"; "$t4"; "$t5";
     "$t6"; "$t7"; "$s0"; "$s1"; "$s2"; "$s3"; "$s4"; "$s5"; "$s6"; "$s7"; "$t8"; "$t9" |]
let fregs = Array.init 28 (fun i -> Printf.sprintf "$f%d" i)(*浮動小数点レジスタは$f0〜$f30*)
let allregs = Array.to_list regs
let allfregs = Array.to_list fregs
let reg_zero = "$zero" (*zero register*)
let reg_cl = regs.(Array.length regs - 1) (* closure address (caml2html: sparcasm_regcl) *)
let reg_sw = regs.(Array.length regs - 2) (* temporary for swap *)
let reg_fsw = fregs.(Array.length fregs - 1) (* temporary for swap *)
let reg_temp = "$k0"
let reg_sp = "$sp" (* stack pointer *)
let reg_hp = "$at" (* heap pointer (caml2html: sparcasm_reghp) *)
let reg_ra = "$ra" (* return address *)
let reg_cond = "$k1" (*condition register*)
let reg_fcond = "$f31" (*floating condition register*)
let reg_f0 = "$f30"
let reg_f05 = "$f29"
let reg_fpi = "$f28"
let reg_ftemp = "$f27"
let is_reg x = (x.[0] = '$')

(* super-tenuki *)
let rec remove_and_uniq xs = function
  | [] -> []
  | x :: ys when S.mem x xs -> remove_and_uniq xs ys
  | x :: ys -> x :: remove_and_uniq (S.add x xs) ys

(* free variables in the order of use (for spilling) (caml2html: sparcasm_fv) *)
let fv_id_or_imm = function V(x) -> [x] | _ -> []

let rec fv_exp = function
  | Nop | Set(_) | SetL(_) | Comment(_) | Restore(_) | Read_int(_) | Read_float(_) -> []
  | Mov(x) | Neg(x) | FMovD(x) | FNegD(x) | FFloor(x) | FSqrt(x) | FAbs(x) | Ftoi(x) | Itof(x) | Print_int(x) | Print_char(x) | Save(x, _) -> [x]
  | Add(x, y') | Sub(x, y') | Mul(x, y') |Div(x, y') | SLL(x, y') | Ld(x, y') | LdDF(x, y') -> x :: fv_id_or_imm y'
  | St(x, y, z') | StDF(x, y, z') -> x :: y :: fv_id_or_imm z'
  | FAddD(x, y) | FSubD(x, y) | FMulD(x, y) | FDivD(x, y) -> [x; y]
  | IfEq(x, y', e1, e2) | IfLE(x, y', e1, e2) | IfGE(x, y', e1, e2) -> x :: fv_id_or_imm y' @ remove_and_uniq S.empty (fv e1 @ fv e2) (* uniq here just for efficiency *)
  | IfFEq(x, y, e1, e2) | IfFLE(x, y, e1, e2) -> x :: y :: remove_and_uniq S.empty (fv e1 @ fv e2) (* uniq here just for efficiency *)
  | CallCls(x, ys, zs) -> x :: ys @ zs
  | CallDir(_, ys, zs) -> ys @ zs
and fv = function
  | Ans(exp) -> fv_exp exp
  | Let((x, t), exp, e) ->
      fv_exp exp @ remove_and_uniq (S.singleton x) (fv e)
let fv e = remove_and_uniq S.empty (fv e)

let rec concat e1 xt e2 =
  match e1 with
  | Ans(exp) -> Let(xt, exp, e2)
  | Let(yt, exp, e1') -> Let(yt, exp, concat e1' xt e2)

(*let align i = (if i mod 8 = 0 then i else i + 4)*) (*ワードアクセスへの変更、float->singleより不要に*)

let rec string_of_asmexp e =
  match e with
  |Nop -> "Nop"
  |Set(i) ->"Set("^(string_of_int i)^")"
  |SetL(s) -> "Set(L("^(Id.string_of_l s)^"))"
  |Mov(s) -> "Mov("^s^")"
  |Neg(s) -> "Neg("^s^")"
  |Add(s1,e1) -> "Add("^s1^","^(string_of_idimm e1)^")"
  |Sub(s1,e1) -> "Sub("^s1^","^(string_of_idimm e1)^")"
  |Mul(s1,e1) -> "Mul("^s1^","^(string_of_idimm e1)^")"
  |Div(s1,e1) -> "Div("^s1^","^(string_of_idimm e1)^")"
  |Ld(s1,e1) -> "Ld("^s1^","^(string_of_idimm e1)^")"
  |St(s1,s2,e1) -> "St("^s1^","^s2^","^(string_of_idimm e1)^")"
  |SLL(s1,e1) -> "SLL("^s1^","^(string_of_idimm e1)^")"
  |FMovD(s) -> "FMovD("^s^")"
  |FNegD(s) -> "FNegD("^s^")"
  |FAddD(s1,s2) -> "FAddD("^s1^","^s2^")"
  |FSubD(s1,s2) -> "FSubD("^s1^","^s2^")"
  |FMulD(s1,s2) -> "FMulD("^s1^","^s2^")"
  |FDivD(s1,s2) -> "FDivD("^s1^","^s2^")"
  |FMovD(s) -> "FMovD("^s^")"
  |FNegD(s) -> "FNegD("^s^")"
  |FFloor(s) -> "FFloor("^s^")"
  |FSqrt(s) -> "FSqrt("^s^")"
  |FAbs(s) -> "FAbs("^s^")"
  |Ftoi(s) -> "Ftoi("^s^")"
  |Itof(s) -> "Itof("^s^")"
  |Read_int(_) -> "Read_int()"
  |Read_float(_) -> "Read_float()"
  |Print_int(s) -> "Print_int("^s^")"
  |Print_char(s) -> "Print_char("^s^")"
  |LdDF(s1,e1) -> "LdDF("^s1^","^(string_of_idimm e1)^")"
  |StDF(s1,s2,e1) -> "StDF("^s1^","^s2^","^(string_of_idimm e1)^")"
  |Comment(s) -> "Comment("^s^")"
  |IfEq(s1,e1,e2,e3) -> "IfEq("^s1^","^(string_of_idimm e1)^","^(string_of_asm e2)^","^(string_of_asm e3)^")"
  |IfLE(s1,e1,e2,e3) -> "IfEq("^s1^","^(string_of_idimm e1)^","^(string_of_asm e2)^","^(string_of_asm e3)^")"
  |IfGE(s1,e1,e2,e3) -> "IfEq("^s1^","^(string_of_idimm e1)^","^(string_of_asm e2)^","^(string_of_asm e3)^")"
  |IfFEq(s1,s2,e1,e2) -> "IfFEq("^s1^","^s2^","^(string_of_asm e1)^","^(string_of_asm e2)^")"
  |IfFLE(s1,s2,e1,e2) -> "IfFLE("^s1^","^s2^","^(string_of_asm e1)^","^(string_of_asm e2)^")"
  (* closure address, integer arguments, and float arguments *)
  |CallCls(s1,ss1,ss2) -> "CallCls("^s1^",["^(string_of_idlist ss1)^",["^(string_of_idlist ss2)^")"
  |CallDir(s1,ss1,ss2) -> "CallDir(L("^(Id.string_of_l s1)^"),["^(string_of_idlist ss1)^",["^(string_of_idlist ss2)^")"
  |Save(s1,s2) ->"Save("^s1^","^s2^")"
  |Restore(s,t) -> "Restore("^s^")"
and string_of_idlist ss =
  match ss with
  |[] -> "]"
  |s::ss1 -> s^"::"^(string_of_idlist ss1)
and string_of_asm e =
  match e with
  |Ans(e1) -> "Ans("^(string_of_asmexp e1)^")"
  |Let((s1,t1),e1,e2) -> "Let("^s1^","^(Type.string_of_type t1)^","^(string_of_asmexp e1)^","^(string_of_asm e2)^")"
and string_of_idimm s =
  match s with
  |V(s) -> s
  |C(i) -> string_of_int i

let string_of_prog p =
  match p with
  |Prog(_,fundefs,e) -> string_of_asm e

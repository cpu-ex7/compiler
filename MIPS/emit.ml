open Asm
open Type
(*
external gethi : float -> int32 = "gethi"
external getlo : float -> int32 = "getlo"
*)(*float->singleに伴い不要*)
type mode = Int | Float

let rec log2 x = if(x < 1) then -1 else if(x = 1) then 0 else log2 (x/2) + 1

let stackset = ref S.empty (* すでにSaveされた変数の集合 (caml2html: emit_stackset) *)
let stackmap = ref [] (* Saveされた変数の、スタックにおける位置 *)
let save x = (*save xの処理は汎用レジスタも浮動小数点レジスタも共通*)
  stackset := S.add x !stackset;
  if not (List.mem x !stackmap) then
    stackmap := !stackmap @ [x]
(*let savef x =
  stackset := S.add x !stackset;
  if not (List.mem x !stackmap) then
    (let pad =
      if List.length !stackmap mod 2 = 0 then [] else [Id.gentmp Type.Int] in
    stackmap := !stackmap @ pad @ [x; x])*)
let locate x =
  let rec loc = function
    | [] -> []
    | y :: zs when x = y -> 0 :: List.map succ (loc zs)
    | y :: zs -> List.map succ (loc zs) in
  loc !stackmap
let offset x = 4 * List.hd (locate x)
let stacksize () = (List.length !stackmap + 1) * 4

let pp_id_or_imm = function
  | V(x) -> x
  | C(i) -> string_of_int i

(* 関数呼び出しのために引数を並べ替える(register shuffling) (caml2html: emit_shuffle) *)
let rec shuffle sw xys =
  (* remove identical moves *)
  let _, xys = List.partition (fun (x, y) -> x = y) xys in
  (* find acyclic moves *)
  match List.partition (fun (_, y) -> List.mem_assoc y xys) xys with
  | [], [] -> []
  | (x, y) :: xys, [] -> (* no acyclic moves; resolve a cyclic move *)
      (y, sw) :: (x, y) :: shuffle sw (List.map
                                         (function
                                           | (y', z) when y = y' -> (sw, z)
                                           | yz -> yz)
                                         xys)
  | xys, acyc -> acyc @ shuffle sw xys

type dest = Tail | NonTail of Id.t (* 末尾かどうかを表すデータ型(caml2html: emit_dest) *)
let rec g oc = function (*命令列のアセンブリ生成(caml2html: emit_g) *)
  | dest, Ans(exp) -> g' oc (dest, exp)
  | dest, Let((x, t), exp, e) ->
      g' oc (NonTail(x), exp);
      g oc (dest, e)
and g' oc = function (* 各命令のアセンブリ生成 (caml2html: emit_gprime) *)
  (*末尾でなかったら計算結果をdestにセット (caml2html: emit_nontail) *)
  | NonTail(_), Nop -> ()(*何も出力しない*)
  | NonTail(x), Set(i) -> Printf.fprintf oc "\taddi\t%s, %s, %d\n" x reg_zero i(*定数のレジスタ代入はaddi*)
  | NonTail(x), SetL(Id.L(y)) -> Printf.fprintf oc "\taddi\t%s, %s, %s\n"x reg_zero y (*ラベルのアドレスをSetするのはaddi?*)
  | NonTail(x), Mov(y) when x = y -> ()(*同じレジスタ間は移動は何もしない*)
  | NonTail(x), Mov(y) -> Printf.fprintf oc "\tadd\t%s, %s, %s\n" x reg_zero y(*汎用レジスタ間移動addiでも可*)
  | NonTail(x), Neg(y) -> Printf.fprintf oc "\tsub\t%s, %s, %s\n" x reg_zero y(*負の値を取るのは0-x*)
  | NonTail(x), Add(y, z') ->
    (match z' with
    |V(r) -> Printf.fprintf oc "\tadd\t%s, %s, %s\n" x y r(*レジスタの場合はadd*)
    |C(i) -> Printf.fprintf oc "\taddi\t%s, %s, %d\n"x y i )(*即値の場合はaddi*)
  | NonTail(x), Sub(y, z') ->
    (match z' with
    |V(r) -> Printf.fprintf oc "\tsub\t%s, %s, %s\n" x y r(*レジスタの場合はsub*)
    |C(i) -> Printf.fprintf oc "\taddi\t%s, %s, %d\n"x y (-i))(*即値の場合はsubi*)
  | NonTail(x), Mul(y, z') ->
    (match z' with
    |V(r) -> assert false
    |C(i) -> Printf.fprintf oc "\tsll\t%s, %s, %d\n"x y (log2 i))
  | NonTail(x), Div(y, z') ->
    (match z' with
    |V(r) -> assert false
    |C(i) -> Printf.fprintf oc "\tsra\t%s, %s, %d\n"x y (log2 i))
  | NonTail(x), SLL(y, z') ->
    (match z' with
    |V(r) -> Printf.fprintf oc "\tsllv\t%s, %s, %s\n" x y r(*レジスタの場合はsllv*)
    |C(i) -> Printf.fprintf oc "\tsll\t%s, %s, %d\n" x y i)(*即値の場合はsll*)
  | NonTail(x), Ld(y, z') ->
    (match z' with
    |V(r) -> Printf.fprintf oc "\tadd\t%s, %s, %s\n" reg_sw y r;
             Printf.fprintf oc "\tlw\t%s, %d(%s)\n" x 0 reg_sw
    |C(i) -> Printf.fprintf oc "\tlw\t%s, %d(%s)\n" x i y)(*汎用レジスタへはlw、z'がレジスタの時はその前でaddでアドレスを計算、結果はスワップレジスタに*)
  | NonTail(_), St(x, y, z') ->
    (match z' with
    |V(r) -> Printf.fprintf oc "\tadd\t%s, %s, %s\n" reg_sw y r;
             Printf.fprintf oc "\tsw\t%s, %d(%s)\n" x 0 reg_sw
    |C(i) -> Printf.fprintf oc "\tsw\t%s, %d(%s)\n" x i y)(*汎用レジスタへはsw、z'がレジスタの時はその前でaddでアドレスを計算、結果はスワップレジスタに*)
  | NonTail(x), FMovD(y) when x = y -> ()(*同じレジスタ同士は何もしない*)
  | NonTail(x), FMovD(y) -> Printf.fprintf oc "\tmvf\t%s, %s\n" x y;
  | NonTail(x), FNegD(y) -> Printf.fprintf oc "\tfnegs\t%s, %s\n" x y;(*TODO:ハードで実装するか？浮動小数点0レジスタがない*)
  | NonTail(x), FAddD(y, z) -> Printf.fprintf oc "\taddf\t%s, %s, %s\n" x y z
  | NonTail(x), FSubD(y, z) -> Printf.fprintf oc "\tsubf\t%s, %s, %s\n" x y z
  | NonTail(x), FMulD(y, z) -> Printf.fprintf oc "\tmulf\t%s, %s, %s\n" x y z
  | NonTail(x), FDivD(y, z) -> Printf.fprintf oc "\tdivf\t%s, %s, %s\n" x y z
  | NonTail(x), FFloor(y) -> Printf.fprintf oc "\tsubf\t%s, %s, %s\n" reg_ftemp y reg_f05;
                             Printf.fprintf oc "\troundwfmt\t%s, %s\n" reg_ftemp reg_ftemp;
                             Printf.fprintf oc "\tcvt.s.w\t%s, %s\n" x reg_ftemp
  | NonTail(x), FSqrt(y) -> Printf.fprintf oc "\tsqrt\t%s, %s\n" x y
  | NonTail(x), FAbs(y) -> Printf.fprintf oc "\tabs\t%s, %s\n" x y
  | NonTail(x), Ftoi(y) -> Printf.fprintf oc "\tsubf\t%s, %s, %s\n" reg_ftemp y reg_f05;
                           Printf.fprintf oc "\troundwfmt\t%s, %s\n" reg_ftemp reg_ftemp;
                           Printf.fprintf oc "\tmfc1\t%s, %s\n" x reg_ftemp
  | NonTail(x), Itof(y) -> Printf.fprintf oc "\tmfc2\t%s, %s\n" reg_ftemp y;
                           Printf.fprintf oc "\tcvtsw\t%s, %s\n" x reg_ftemp
  | NonTail(x), Read_int(_) -> Printf.fprintf oc "\tlwc2\t%s\n" x
  | NonTail(x), Read_float(_) -> Printf.fprintf oc "\tlwc2\t%s\n" reg_temp;
                                 Printf.fprintf oc "\tmfc2\t%s, %s\n" x reg_temp
  | NonTail(_), Print_int(y) -> Printf.fprintf oc "\taddi\t%s, %s, %d\n" reg_temp y 48;
                                Printf.fprintf oc "\tswc2\t%s\n" reg_temp(*TODO: 0~9しか対応してない、ちゃんと呼ばれるなら真面目に実装*)
  | NonTail(_), Print_char(y) -> Printf.fprintf oc "\tswc2\t%s\n" y
  | NonTail(x), LdDF(y, z') ->
  (match z' with
  |V(r) -> Printf.fprintf oc "\tadd\t%s, %s, %s\n" reg_temp y r;
           Printf.fprintf oc "\tlwc1\t%s, %d(%s)\n" x 0 reg_temp
  |C(i) -> Printf.fprintf oc "\tlwc1\t%s, %d(%s)\n" x i y)(*浮動小数点レジスタへはlwc1*)
  | NonTail(_), StDF(x, y, z') ->
  (match z' with
  |V(r) -> Printf.fprintf oc "\tadd\t%s, %s, %s\n" reg_temp y r;
           Printf.fprintf oc "\tswc1\t%s, %d(%s)\n" x 0 reg_temp
  |C(i) -> Printf.fprintf oc "\tswc1\t%s, %d(%s)\n" x i y)(*浮動小数点レジスタへはswc1*)
  | NonTail(_), Comment(s) -> Printf.fprintf oc "\t! %s\n" s
  (* 退避の仮想命令の実装(caml2html: emit_save) *)
  | NonTail(_), Save(x, y) when List.mem x allregs && not (S.mem y !stackset) ->
      save y;
      Printf.fprintf oc "\tsw\t%s, %d(%s)\n" x (offset y) reg_sp
  | NonTail(_), Save(x, y) when List.mem x allfregs && not (S.mem y !stackset) ->
      (*savef y;*)
      save y;
      Printf.fprintf oc "\tswc1\t%s, %d(%s)\n" x (offset y) reg_sp
  | NonTail(_), Save(x, y) -> assert (S.mem y !stackset); ()
  (* 復帰の仮想命令の実装(caml2html: emit_restore) *)
  | NonTail(x), Restore(y,_) when List.mem x allregs ->
      Printf.fprintf oc "\tlw\t%s, %d(%s)\n" x (offset y) reg_sp
  | NonTail(x), Restore(y,_) ->
      assert (List.mem x allfregs);
      Printf.fprintf oc "\tlwc1\t%s, %d(%s)\n" x (offset y) reg_sp
  (* 末尾だったら計算結果を第一レジスタにセットしてret (caml2html: emit_tailret) *)
  | Tail, (Nop | St _ | StDF _ | Comment _ | Print_int _ | Print_char _ | Save _ as exp) ->
      g' oc (NonTail(Id.gentmp Type.Unit), exp);
      Printf.fprintf oc "\tjr\t$ra\n";(*$raに保存されているリターンアドレスに復帰*)
      (*Printf.fprintf oc "\tnop\n"*)(*必要かわからん*)
  | Tail, (Set _ | SetL _ | Mov _ | Neg _ | Add _ | Sub _ | SLL _ | Mul _ | Div _ | Ftoi _ | Read_int _ | Ld _ as exp) ->
      g' oc (NonTail(regs.(0)), exp);(*戻り値は$v0(regs.(0))*)
      Printf.fprintf oc "\tjr\t$ra\n";
      (*Printf.fprintf oc "\tnop\n"*)
  | Tail, (FMovD _ | FNegD _ | FAddD _ | FSubD _ | FMulD _ | FDivD _ | FFloor _ | FSqrt _ | FAbs _ | Itof _ | Read_float _ | LdDF _ as exp) ->
      g' oc (NonTail(fregs.(0)), exp);(*戻り値は$f0(regs.(0))*)
      Printf.fprintf oc "\tjr\t$ra\n";
      (*Printf.fprintf oc "\tnop\n"*)
  (*| Tail, (Restore(x) as exp) ->
      (match locate x with
      | [i] -> g' oc (NonTail(regs.(0)), exp)
      | [i; j] when i + 1 = j -> g' oc (NonTail(fregs.(0)), exp)
      | _ -> assert false);
      Printf.fprintf oc "\tjr\t$ra\n";
      (*Printf.fprintf oc "\tnop\n"*)*)
  | Tail, (Restore(x,t) as exp) ->
    (match t with
    |Float -> g' oc (NonTail(fregs.(0)), exp)
    |_ -> g' oc (NonTail(regs.(0)), exp));
    Printf.fprintf oc "\tjr\t$ra\n";
  | Tail, IfEq(x, y', e1, e2) -> (*IfEqは即値最適化はしない*)
      (match y' with
      | V(r) -> g'_tail_if Int oc x r e1 e2 "beq" "bne"
      | C(i) -> assert false)
  | Tail, IfLE(x, y', e1, e2) ->
      (match y' with
      | V(r) ->
        Printf.fprintf oc "\tsgt\t%s, %s, %s\n" reg_cond x r;
        g'_tail_if Int oc reg_zero reg_cond e1 e2 "beq" "bne"
      | C(i) ->
        Printf.fprintf oc "\tsgti\t%s, %s, %d\n" reg_cond x i;
        g'_tail_if Int oc reg_zero reg_cond e1 e2 "beq" "bne"
      )
  | Tail, IfGE(x, y', e1, e2) ->
      (match y' with
      | V(r) ->
        Printf.fprintf oc "\tslt\t%s, %s, %s\n" reg_cond x r;
        g'_tail_if Int oc reg_zero reg_cond e1 e2 "beq" "bne"
      | C(i) ->
        Printf.fprintf oc "\tslti\t%s, %s, %d\n" reg_cond x i;
        g'_tail_if Int oc reg_zero reg_cond e1 e2 "beq" "bne"
      )
  | Tail, IfFEq(x, y, e1, e2) ->
      Printf.fprintf oc "\teqf\t%s, %s\n" x y;
      g'_tail_if Float oc "$dummy" "$dummy" e1 e2 "bc1t" "bc1f"
  | Tail, IfFLE(x, y, e1, e2) ->
      Printf.fprintf oc "\tlef\t%s, %s\n" x y;
      g'_tail_if Float oc "$dummy" "$dummy" e1 e2 "bc1t" "bc1f"
  | NonTail(z), IfEq(x, y', e1, e2) ->
      (match y' with
      | V(r) -> g'_non_tail_if Int oc (NonTail(z)) x r e1 e2 "beq" "bne"
      | C(i) -> assert false)
  | NonTail(z), IfLE(x, y', e1, e2) ->
      (match y' with
      | V(r) ->
        Printf.fprintf oc "\tsgt\t%s, %s, %s\n" reg_cond x r;
        g'_non_tail_if Int oc (NonTail(z)) reg_zero reg_cond e1 e2 "beq" "bne"
      | C(i) ->
        Printf.fprintf oc "\tsgti\t%s, %s, %d\n" reg_cond x i;
        g'_non_tail_if Int oc (NonTail(z)) reg_zero reg_cond e1 e2 "beq" "bne"
      )
  | NonTail(z), IfGE(x, y', e1, e2) ->
      (match y' with
      | V(r) ->
        Printf.fprintf oc "\tslt\t%s, %s, %s\n" reg_cond x r;
        g'_non_tail_if Int oc (NonTail(z)) reg_zero reg_cond e1 e2 "beq" "bne"
      | C(i) ->
        Printf.fprintf oc "\tslti\t%s, %s, %d\n" reg_cond x i;
        g'_non_tail_if Int oc (NonTail(z)) reg_zero reg_cond e1 e2 "beq" "bne"
      )
  | NonTail(z), IfFEq(x, y, e1, e2) ->
      Printf.fprintf oc "\teqf\t%s, %s\n" x y;
      g'_non_tail_if Float oc (NonTail(z)) "$dummy" "$dummy" e1 e2 "bc1t" "bc1f"
  | NonTail(z), IfFLE(x, y, e1, e2) ->
      Printf.fprintf oc "\tlef\t%s, %s\n" x y;
      g'_non_tail_if Float oc (NonTail(z)) "$dummy" "$dummy" e1 e2 "bc1t" "bc1f"
  (* 関数呼び出しの仮想命令の実装(caml2html: emit_call) *)
  | Tail, CallCls(x, ys, zs) -> (* 末尾呼び出し (caml2html: emit_tailcall) *)
      g'_args oc [(x, reg_cl)] ys zs;
      Printf.fprintf oc "\tlw\t%s, 0(%s)\n" reg_sw reg_cl;(*クロージャアドレスをロード*)
      Printf.fprintf oc "\tjr\t%s\n" reg_sw;(*クロージャアドレスにジャンプ*)
      (*Printf.fprintf oc "\tnop\n"*)(*必要かわからん*)
  | Tail, CallDir(Id.L(x), ys, zs) -> (* 末尾呼び出し *)
      g'_args oc [] ys zs;
      Printf.fprintf oc "\tj\t%s\n" x;(*単なるジャンプでいい*)
      (*Printf.fprintf oc "\tnop\n"*)(*必要かわからん*)
  | NonTail(a), CallCls(x, ys, zs) ->
      g'_args oc [(x, reg_cl)] ys zs;
      let ss = stacksize () in
      Printf.fprintf oc "\tsw\t%s, %d(%s)\n" reg_ra (ss - 4) reg_sp  ; (*リターンアドレスを退避*)
      Printf.fprintf oc "\tlw\t%s, 0(%s)\n" reg_sw reg_cl; (*わからん*)
      Printf.fprintf oc "\taddi\t%s, %s, %d\n" reg_sp reg_sp ss;
      Printf.fprintf oc "\tjal\t%s\n" reg_sw; (*関数呼び出し*)
      Printf.fprintf oc "\taddi\t%s, %s, %d\n" reg_sp reg_sp (-ss);
      (*Printf.fprintf oc "\taddi\t%s, %s, %d\t! delay slot\n" reg_sp reg_sp ss; (*わからん*)
      Printf.fprintf oc "\tsubi\t%s, %s, %d\n" reg_sp reg_sp ss;*)(*わからん*)
      Printf.fprintf oc "\tlw\t%s, %d(%s)\n" reg_ra (ss - 4) reg_sp;(*リターンアドレスの復帰*)
      if List.mem a allregs && a <> regs.(0) then
        Printf.fprintf oc "\taddi\t%s, %s, 0\n" a regs.(0)(*返り値をほしい場所に移動*)
      else if List.mem a allfregs && a <> fregs.(0) then
        (Printf.fprintf oc "\tmvf\t%s, %s\n" a fregs.(0))(*返り値をほしい場所に移動*)
  | NonTail(a), CallDir(Id.L(x), ys, zs) ->
      g'_args oc [] ys zs;
      let ss = stacksize () in
      Printf.fprintf oc "\tsw\t%s, %d(%s)\n" reg_ra (ss - 4) reg_sp;(*リターンアドレスを退避*)
      Printf.fprintf oc "\taddi\t%s, %s, %d\n" reg_sp reg_sp ss;
      Printf.fprintf oc "\tjal\t%s\n" x;(*関数呼び出し*)
      Printf.fprintf oc "\taddi\t%s, %s, %d\n" reg_sp reg_sp (-ss);
      (*Printf.fprintf oc "\tadd\t%s, %d, %s\t! delay slot\n" reg_sp ss reg_sp;(*わからん*)
      Printf.fprintf oc "\tsub\t%s, %d, %s\n" reg_sp ss reg_sp;*)(*わからん*)
      Printf.fprintf oc "\tlw\t%s, %d(%s)\n" reg_ra (ss - 4) reg_sp;(*リターンアドレスの復帰*)
      if List.mem a allregs && a <> regs.(0) then
        Printf.fprintf oc "\taddi\t%s, %s, 0\n" a regs.(0)(*返り値をほしい場所に移動*)
      else if List.mem a allfregs && a <> fregs.(0) then
        (Printf.fprintf oc "\tmvf\t%s, %s\n" a fregs.(0))(*返り値をほしい場所に移動*)
and g'_tail_if mode oc reg1 reg2 e1 e2 b bn =
  let b_else = Id.genid (b ^ "_else") in
  (match mode with
  |Int -> Printf.fprintf oc "\t%s\t%s, %s, %s\n" bn reg1 reg2 b_else
  |Float -> Printf.fprintf oc "\t%s\t%s\n" bn b_else);
  let stackset_back = !stackset in
  g oc (Tail, e1);
  Printf.fprintf oc "%s:\n" b_else;
  stackset := stackset_back;
  g oc (Tail, e2)
and g'_non_tail_if mode oc dest reg1 reg2 e1 e2 b bn =
  let b_else = Id.genid (b ^ "_else") in
  let b_cont = Id.genid (b ^ "_cont") in
  (match mode with
  |Int -> Printf.fprintf oc "\t%s\t%s, %s, %s\n" bn reg1 reg2 b_else
  |Float -> Printf.fprintf oc "\t%s\t%s\n" bn b_else);
  let stackset_back = !stackset in
  g oc (dest, e1);
  let stackset1 = !stackset in
  Printf.fprintf oc "\tj\t%s\n" b_cont;
  (*Printf.fprintf oc "\tnop\n";*)
  Printf.fprintf oc "%s:\n" b_else;
  stackset := stackset_back;
  g oc (dest, e2);
  Printf.fprintf oc "%s:\n" b_cont;
  let stackset2 = !stackset in
  stackset := S.inter stackset1 stackset2
and g'_args oc x_reg_cl ys zs =
  let (i, yrs) =
    List.fold_left
      (fun (i, yrs) y -> (i + 1, (y, regs.(i)) :: yrs))
      (0, x_reg_cl)
      ys in
  List.iter
    (fun (y, r) -> Printf.fprintf oc "\taddi\t%s, %s, 0\n" r y)
    (shuffle reg_sw yrs);
  let (d, zfrs) =
    List.fold_left
      (fun (d, zfrs) z -> (d + 1, (z, fregs.(d)) :: zfrs))
      (0, [])
      zs in
  List.iter
    (fun (z, fr) ->
      Printf.fprintf oc "\tmvf\t%s, %s\n" fr z)
    (shuffle reg_fsw zfrs)

let h oc { name = Id.L(x); args = _; fargs = _; body = e; ret = _ } =
  Printf.fprintf oc "%s:\n" x;
  stackset := S.empty;
  stackmap := [];
  g oc (Tail, e)

let f oc (Prog(data, fundefs, e)) =
  Format.eprintf "generating assembly...@.";
  (*Printf.fprintf oc ".section\t\".rodata\"\n";
  Printf.fprintf oc ".align\t8\n";*)
  let lastlabel = ref "0" in
  (List.iter
    (*(fun (Id.L(x), d) ->
      Printf.fprintf oc "%s:\t! %f\n" x d;
      Printf.fprintf oc "\t.long\t0x%lx\n" (Int32.bits_of_float d))*)
    (fun (Id.L(x), d) ->
      Printf.fprintf oc "%s:\n" x;
      Printf.fprintf oc "#!%f\n" d;
      let d_bit = Int32.bits_of_float d in
      Printf.fprintf oc "\taddi\t%s, %s, %d\n" reg_temp reg_zero 0;
      Printf.fprintf oc "\tlui\t%s, %s\n" reg_temp (Int32.to_string (Int32.shift_right_logical d_bit 16));
      Printf.fprintf oc "\tori\t%s, %s, %s\n" reg_temp reg_temp (Int32.to_string (Int32.shift_right_logical (Int32.shift_left d_bit 16) 16));
      Printf.fprintf oc "\tsw\t%s, %s(%s)\n" reg_temp x reg_zero;
      lastlabel := x)
    data);

    Printf.fprintf oc "\taddi\t%s, %s, %s\n" reg_sp reg_zero (!lastlabel);
    Printf.fprintf oc "\taddi\t%s, %s, %d\n" reg_sp reg_sp 4;
    Printf.fprintf oc "\taddi\t%s, %s, %d\n" reg_hp reg_sp 2048;
    Printf.fprintf oc "\taddi\t%s, %s, %d\n" reg_temp reg_zero 0;
    Printf.fprintf oc "\tlui\t%s, %s\n" reg_temp (Int32.to_string (Int32.shift_right_logical (Int32.bits_of_float 0.5) 16));
    Printf.fprintf oc "\tori\t%s, %s, %s\n" reg_temp reg_temp (Int32.to_string (Int32.shift_right_logical (Int32.shift_left (Int32.bits_of_float 0.5) 16) 16));
    Printf.fprintf oc "\tmfc2\t%s, %s\n" reg_f05 reg_temp;
    Printf.fprintf oc "\tmfc2\t%s, %s\n" reg_f0 reg_zero;
    (*Printf.fprintf oc "\tsave\t%%sp, -112, %%sp\n";*) (* from gcc; why 112? *)
  Printf.fprintf oc "min_caml_start:\n";
  stackset := S.empty;
  stackmap := [];
  g oc (NonTail("$g0"), e);
  (*Printf.fprintf oc "\tjr\t%s\n" reg_ra;*)
  Printf.fprintf oc "\thalt\n";
  (*Printf.fprintf oc ".section\t\".text\"\n";*)
  List.iter (fun fundef -> h oc fundef) fundefs
  (*Printf.fprintf oc ".global\tmin_caml_start\n";*)
  (*Printf.fprintf oc "min_caml_start:\n";*)
  (*Printf.fprintf oc "\tsave\t%%sp, -112, %%sp\n";*) (* from gcc; why 112? *)
  (*stackset := S.empty;
  stackmap := [];
  g oc (NonTail("$g0"), e);
  Printf.fprintf oc "\tjr\t%s\n" reg_ra;
  Printf.fprintf oc "\thlt\n"*)

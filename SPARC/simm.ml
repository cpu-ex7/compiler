open Asm

let rec g env = function (* 命令列の16bit即値最適化(caml2html: simm13_g) *)(*Shift命令だけ0<x<32だが個別判定はしていない*)
  | Ans(exp) -> Ans(g' env exp)
  | Let((x, t), Set(i), e) when -32768 <= i && i < 32768 -> (*16bit以内で収まる定数(Set()で定義されるもの)をenvに追加*)
      (* Format.eprintf "found simm13 %s = %d@." x i; *)
      let e' = g (M.add x i env) e in
      if List.mem x (fv e') then Let((x, t), Set(i), e') else
      ((* Format.eprintf "erased redundant Set to %s@." x; *)
       e')
  | Let(xt, SLL(y, C(i)), e) when M.mem y env -> (* for array access *)(*先に定数と定数の演算は計算しておく*)
      (* Format.eprintf "erased redundant SLL on %s@." x; *)
      g env (Let(xt, Set((M.find y env) lsl i), e))
  | Let(xt, exp, e) -> Let(xt, g' env exp, g env e)
and g' env = function (* 各命令の16bit即値最適化、envにレジスタ変数と値の組が入っているので置き換え(caml2html: simm13_gprime) *)
  | Add(x, V(y)) when M.mem y env -> Add(x, C(M.find y env))
  | Add(x, V(y)) when M.mem x env -> Add(y, C(M.find x env))
  | Sub(x, V(y)) when M.mem y env -> Sub(x, C(M.find y env))
  | Mul(x, V(y)) when M.mem y env -> Mul(x, C(M.find y env))
  | Mul(x, V(y)) when M.mem x env -> Mul(y, C(M.find x env))
  | Div(x, V(y)) when M.mem y env -> Div(x, C(M.find y env))
  | SLL(x, V(y)) when M.mem y env -> SLL(x, C(M.find y env))
  | Ld(x, V(y)) when M.mem y env -> Ld(x, C(M.find y env))
  | St(x, y, V(z)) when M.mem z env -> St(x, y, C(M.find z env))
  | LdDF(x, V(y)) when M.mem y env -> LdDF(x, C(M.find y env))
  | StDF(x, y, V(z)) when M.mem z env -> StDF(x, y, C(M.find z env))
  (*| IfEq(x, V(y), e1, e2) when M.mem y env -> IfEq(x, C(M.find y env), g env e1, g env e2)*)(*IfEqだけは即値を引数にとらない*)
  | IfLE(x, V(y), e1, e2) when M.mem y env -> IfLE(x, C(M.find y env), g env e1, g env e2)
  | IfGE(x, V(y), e1, e2) when M.mem y env -> IfGE(x, C(M.find y env), g env e1, g env e2)
  (*| IfEq(x, V(y), e1, e2) when M.mem x env -> IfEq(y, C(M.find x env), g env e1, g env e2)*)(*IfEqだけは即値を引数にとらない*)
  | IfLE(x, V(y), e1, e2) when M.mem x env -> IfGE(y, C(M.find x env), g env e1, g env e2)
  | IfGE(x, V(y), e1, e2) when M.mem x env -> IfLE(y, C(M.find x env), g env e1, g env e2)
  | IfEq(x, y', e1, e2) -> IfEq(x, y', g env e1, g env e2)
  | IfLE(x, y', e1, e2) -> IfLE(x, y', g env e1, g env e2)
  | IfGE(x, y', e1, e2) -> IfGE(x, y', g env e1, g env e2)
  | IfFEq(x, y, e1, e2) -> IfFEq(x, y, g env e1, g env e2)
  | IfFLE(x, y, e1, e2) -> IfFLE(x, y, g env e1, g env e2)
  | e -> e

let h { name = l; args = xs; fargs = ys; body = e; ret = t } = (*トップレベル関数の13bit即値最適化*)
  { name = l; args = xs; fargs = ys; body = g M.empty e; ret = t }

let f (Prog(data, fundefs, e)) = (*プログラム全体の13bit即値最適化*)
  Prog(data, List.map h fundefs, g M.empty e)

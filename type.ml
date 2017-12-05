type t = (* MinCaml�η���ɽ�������ǡ����� (caml2html: type_t) *)
  | Unit
  | Bool
  | Int
  | Float
  | Fun of t list * t (* arguments are uncurried *)
  | Tuple of t list
  | Array of t
  | Var of t option ref

let gentyp () = Var(ref None) (* ���������ѿ������� *)


let rec string_of_type t =
  match t with
  |Unit -> "Unit"
  |Bool -> "Bool"
  |Int -> "Int"
  |Float -> "Float"
  |Fun(e1,e2) -> "(["^(string_of_typelist e1)^"],"^(string_of_type e2)^"]"
  |Tuple(e1) -> "["^(string_of_typelist e1)^"]"
  |Array(e1) -> "Array("^(string_of_type e1)^")"
  |Var(e1) -> (match (!e1) with
              |None -> "None"
              |Some(e2)-> "Var("^(string_of_type e2)^")")

and string_of_typelist t =
  match t with
  |[] -> ""
  |t1::t2 -> (string_of_type t1)^"::"^(string_of_typelist t2)

and string_of_typeidlist e =
  match e with
  |[] -> "]"
  |(e1,e2)::e3 -> "("^e1^","^(string_of_type e2)^")::"^(string_of_typeidlist e3)

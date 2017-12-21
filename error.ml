open Lexing
open Parsing

exception ParseError of Lexing.position * Lexing.position

(* 1ファイルからしか読まないのでファイル名は出力しない *)
let explain_lex_error buf start end_ =
  failwith
    (Printf.sprintf "Lexing error near '%s' (line %d, charcter %d..%d)"
       (Lexing.lexeme buf)
       (start.pos_lnum)
       (start.pos_cnum -start.pos_bol)
       (end_.pos_cnum - end_.pos_bol))

let explain_parse_error buf start end_ =
  failwith
    (Printf.sprintf "ParseError near '%s' (line %d, charcter %d..%d)"
       (Lexing.lexeme buf)
       (start.pos_lnum)
       (start.pos_cnum -start.pos_bol)
       (end_.pos_cnum - end_.pos_bol))

type token =
  | BOOL of (bool)
  | INT of (int)
  | FLOAT of (float)
  | FABS
  | FSQRT
  | FTOI
  | ITOF
  | READ_INT
  | READ_FLOAT
  | PRINT_CHAR
  | PRINT_INT
  | FLOOR
  | NOT
  | MINUS
  | PLUS
  | MUL
  | DIV
  | MINUS_DOT
  | PLUS_DOT
  | AST_DOT
  | SLASH_DOT
  | EQUAL
  | LESS_GREATER
  | LESS_EQUAL
  | GREATER_EQUAL
  | LESS
  | GREATER
  | IF
  | THEN
  | ELSE
  | IDENT of (Id.t)
  | LET
  | IN
  | REC
  | COMMA
  | ARRAY_CREATE
  | DOT
  | LESS_MINUS
  | SEMICOLON
  | LPAREN
  | RPAREN
  | EOF

val exp :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Syntax.t

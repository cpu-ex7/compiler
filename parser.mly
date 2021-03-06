%{
(* parser�����Ѥ����ѿ����ؿ������ʤɤ����� *)
open Syntax
let addtyp x = (x, Type.gentyp ())
%}

/* (* ������ɽ���ǡ����������� (caml2html: parser_token) *) */
%token <bool> BOOL
%token <int> INT
%token <float> FLOAT
%token FABS
%token FSQRT
%token FTOI
%token ITOF
%token READ_INT
%token READ_FLOAT
%token PRINT_CHAR
%token PRINT_INT
%token FLOOR
%token NOT
%token MINUS
%token PLUS
%token MUL
%token DIV
%token MINUS_DOT
%token PLUS_DOT
%token AST_DOT
%token SLASH_DOT
%token EQUAL
%token LESS_GREATER
%token LESS_EQUAL
%token GREATER_EQUAL
%token LESS
%token GREATER
%token IF
%token THEN
%token ELSE
%token <Id.t> IDENT
%token LET
%token IN
%token REC
%token COMMA
%token ARRAY_CREATE
%token DOT
%token LESS_MINUS
%token SEMICOLON
%token LPAREN
%token RPAREN
%token EOF

/* (* ͥ�����̤�associativity���������㤤�������⤤���ء� (caml2html: parser_prior) *) */
%nonassoc IN
%right prec_let
%right SEMICOLON
%right prec_if
%right LESS_MINUS
%nonassoc prec_tuple
%left COMMA
%left EQUAL LESS_GREATER LESS GREATER LESS_EQUAL GREATER_EQUAL
%left PLUS MINUS PLUS_DOT MINUS_DOT MUL DIV
%left AST_DOT SLASH_DOT
%right prec_unary_minus
%left prec_app
%left DOT

/* (* ���ϵ��������� *) */
%type <Syntax.t> exp
%start exp

%%

simple_exp: /* (* ���̤��Ĥ��ʤ��Ƥ��ؿ��ΰ����ˤʤ��뼰 (caml2html: parser_simple) *) */
| LPAREN exp RPAREN
    { $2 }
| LPAREN RPAREN
    { Unit }
| BOOL
    { Bool($1) }
| INT
    { Int($1) }
| FLOAT
    { Float($1) }
| IDENT
    { Var($1) }
| simple_exp DOT LPAREN exp RPAREN
    { Get($1, $4) }

exp: /* (* ���̤μ� (caml2html: parser_exp) *) */
| simple_exp
    { $1 }
| FABS actual_args                   %prec prec_app   { Fabs ($2)     }
| FSQRT actual_args                  %prec prec_app   { Fsqrt($2)     }
| FTOI actual_args                   %prec prec_app   { FtoI($2)      }
| ITOF actual_args                   %prec prec_app   { ItoF($2)      }
| READ_INT actual_args               %prec prec_app   { ReadInt($2)   }
| READ_FLOAT actual_args             %prec prec_app   { ReadFloat($2) }
| PRINT_CHAR actual_args             %prec prec_app   { PrintChar($2) }
| PRINT_INT actual_args              %prec prec_app   { PrintInt($2)  }
| FLOOR actual_args                  %prec prec_app   { Floor($2)     }
| NOT exp
    %prec prec_app
    { Not($2) }
| MINUS exp
    %prec prec_unary_minus
    { match $2 with
    | Float(f) -> Float(-.f) (* -1.23�ʤɤϷ����顼�ǤϤʤ��Τ��̰��� *)
    | e -> Neg(e) }
| exp PLUS exp /* (* ­��������ʸ���Ϥ����롼�� (caml2html: parser_add) *) */
    { Add($1, $3) }
| exp MINUS exp
    { Sub($1, $3) }
| exp MUL exp
    { Mul ($1, $3)    }
| exp DIV exp
    { Div ($1, $3)    }
| exp EQUAL exp
    { Eq($1, $3) }
| exp LESS_GREATER exp
    { Not(Eq($1, $3)) }
| exp LESS exp
    { Not(LE($3, $1)) }
| exp GREATER exp
    { Not(LE($1, $3)) }
| exp LESS_EQUAL exp
    { LE($1, $3) }
| exp GREATER_EQUAL exp
    { LE($3, $1) }
| IF exp THEN exp ELSE exp
    %prec prec_if
    { If($2, $4, $6) }
| MINUS_DOT exp
    %prec prec_unary_minus
    { FNeg($2) }
| exp PLUS_DOT exp
    { FAdd($1, $3) }
| exp MINUS_DOT exp
    { FSub($1, $3) }
| exp AST_DOT exp
    { FMul($1, $3) }
| exp SLASH_DOT exp
    { FDiv($1, $3) }
| LET IDENT EQUAL exp IN exp
    %prec prec_let
    { Let(addtyp $2, $4, $6) }
| LET REC fundef IN exp
    %prec prec_let
    { LetRec($3, $5) }
| simple_exp actual_args
    %prec prec_app
    { App($1, $2) }
| elems
    %prec prec_tuple
    { Tuple($1) }
| LET LPAREN pat RPAREN EQUAL exp IN exp
    { LetTuple($3, $6, $8) }
| simple_exp DOT LPAREN exp RPAREN LESS_MINUS exp
    { Put($1, $4, $7) }
| exp SEMICOLON exp
    { Let((Id.gentmp Type.Unit, Type.Unit), $1, $3) }
| ARRAY_CREATE simple_exp simple_exp
    %prec prec_app
    { Array($2, $3) }
| error
    { failwith
        (Printf.sprintf "parse error near characters %d-%d"
           (Parsing.symbol_start ())
           (Parsing.symbol_end ())) }

fundef:
| IDENT formal_args EQUAL exp
    { { name = addtyp $1; args = $2; body = $4 } }

formal_args:
| IDENT formal_args
    { addtyp $1 :: $2 }
| IDENT
    { [addtyp $1] }

actual_args:
| actual_args simple_exp
    %prec prec_app
    { $1 @ [$2] }
| simple_exp
    %prec prec_app
    { [$1] }

elems:
| elems COMMA exp
    { $1 @ [$3] }
| exp COMMA exp
    { [$1; $3] }

pat:
| pat COMMA IDENT
    { $1 @ [addtyp $3] }
| IDENT COMMA IDENT
    { [addtyp $1; addtyp $3] }

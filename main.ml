let limit = ref 1000

let rec iter n e = (* ��Ŭ�������򤯤꤫���� (caml2html: main_iter) *)
  Format.eprintf "iteration %d@." n;
  if n = 0 then e else
  let e' = Elim.f (ConstFold.f (Inline.f (Assoc.f (Beta.f e)))) in
  if e = e' then e else
  iter (n - 1) e'


  let lexbuf outchan l gl = (* �Хåե��򥳥��ѥ��뤷�ƥ������ͥ��ؽ��Ϥ��� (caml2html: main_lexbuf) *)
    Id.counter := 0;
    Typing.extenv := M.empty;
    let virtuals =
      Virtual.f
       (Closure.f
          (iter !limit
             (Alpha.f
                (KNormal.f
                   (Typing.f
                    (Join.join_glb (Parser.exp Lexer.token l) (Parser.exp Lexer.token gl))))))) in
      Emit.f outchan (RegAlloc.f (Simm.f virtuals))

let lexbuf2 outchan l = (* �Хåե��򥳥��ѥ��뤷�ƥ������ͥ��ؽ��Ϥ��� (caml2html: main_lexbuf) *)
  Id.counter := 0;
  Typing.extenv := M.empty;
  let virtuals =
    Virtual.f
     (Closure.f
      (iter !limit
       (Alpha.f
        (KNormal.f
         (Typing.f
          (Parser.exp Lexer.token l)))))) in
          Emit.f outchan (RegAlloc.f (Simm.f virtuals))

let string s =
  let glinchan = open_in ("globals.ml") in
  let result = lexbuf stdout (Lexing.from_string s) (Lexing.from_channel glinchan) in
  close_in glinchan;
  result
    (* ʸ�����򥳥��ѥ��뤷��ɸ�����Ϥ�ɽ������ (caml2html: main_string) *)

let file f = (* �ե������򥳥��ѥ��뤷�ƥե������˽��Ϥ��� (caml2html: main_file) *)
  let inchan = open_in (f ^ ".ml") in
  let outchan = open_out (f ^ ".s") in
  let glinchan = open_in ("globals.ml") in
  try
    lexbuf2 outchan (Lexing.from_channel inchan) (*Lexing.from_channel glinchan*);
    close_in inchan;
    close_in glinchan;
    close_out outchan;
  with e -> (close_in inchan; close_out outchan; raise e)

let () = (* �������饳���ѥ����μ¹Ԥ����Ϥ����� (caml2html: main_entry) *)
  let files = ref [] in
  Arg.parse
    [("-inline", Arg.Int(fun i -> Inline.threshold := i), "maximum size of functions inlined");
     ("-iter", Arg.Int(fun i -> limit := i), "maximum number of optimizations iterated")]
    (fun s -> files := !files @ [s])
    ("Mitou Min-Caml Compiler (C) Eijiro Sumii\n" ^
     Printf.sprintf "usage: %s [-inline m] [-iter n] ...filenames without \".ml\"..." Sys.argv.(0));
  List.iter
    (fun f -> ignore (file f))
    !files

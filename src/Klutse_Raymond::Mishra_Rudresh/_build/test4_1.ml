open PfxAst
open PfxEval


let args = 10;;
let cmds = [ Push 2; Pop ] ;;


let x = string_of_program (args, cmds) ;;

open Printf
let xx =
  print_endline ("test -----") 
;;

let _ =
  print_endline (x) 
;;


let xx =
  print_endline ("test 4_2 -----") 
;;


let cmds = [Swap ; Pop] ;; 
let stack = [1;2;3] ;;
let numargs = 2 ;;
let args = [2;1]  ;;


let _ = print_endline (string_of_state(cmds,stack)) 
;;


let _ = print_endline (string_of_stack stack) 
;;

let tt = eval_program (numargs, cmds) args ;;

let _ = print_endline ("test 5.1-------------------") 
;;

open ExprToPfx

(*let expr = ;;

let generate expr = String.concat " " (List.map generate expr)
*)
(*2 add push 2 div -- result is 5 if args are 3, 7*)

let _=print_endline ("**************************6.2***************************");;

let parse_eval file =
  print_string ("File "^file^" is being treated!\n");
  try
    let input_file = open_in file in
    let lexbuf = Lexing.from_channel input_file in
    begin
      try
        let expr_prog = ExprParser.expression ExprLexer.token lexbuf in
	print_endline (expr_prog);
        let pfx_prog = 0,[Push 2] in
        print_endline (PfxAst.string_of_program pfx_prog);
         PfxEval.eval_program pfx_prog []
      with
      | PfxParser.Error ->
         print_string "Syntax error: ";
         Location.print (Location.curr lexbuf)
      | Location.Error(e,l) ->
         print_string e;
         Location.print l
    end;
    close_in (input_file)
  with Sys_error s ->
    print_endline ("Can't find file '" ^ file ^ "'")

(* Here we add the parsing of the command line and link to the main function *)
let _ =
  Arg.parse [] parse_eval ""
















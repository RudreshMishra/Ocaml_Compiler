
open PfxParser
open PfxAst


let args = ref []


let compile file =
  print_string ("File "^file^" is being treated!\n");
  try
    let input_file = open_in file in
    let lexbuf = Lexing.from_channel input_file in
    begin
      try
        let ast = PfxParser.program PfxLexer.token lexbuf in
	let rec output_the_ast ast = output_command ast 
	and output_command ast =
         match ast with
	| int,command ->	
		Printf.printf "integer %d\n" int;
		output_command_list command
	and output_command_list commands=
	 match commands with 
	| [] ->exit 0;
	| head::tail -> output_put head;
			output_command_list tail
	and output_put value =
	match value with

	| Pop-> Printf.printf "POP\n ";
	| Push i-> Printf.printf "Push %d\n" i;
	| Add-> Printf.printf "ADD\n ";
	| Sub-> Printf.printf "SUB\n ";
	| Div-> Printf.printf "DIV\n ";
	| Swap-> Printf.printf "SWAP\n ";
	| Mul-> Printf.printf "MUL\n ";
	| Rem-> Printf.printf "REM\n ";
	| _ -> exit 0;
	in
	output_the_ast ast;
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


(*let file = /home/rudresh/Documents/MSC2/Language/project-skeleton/project/test_parser.pfx*)

(* Here we add the parsing of the command line and link to the main function *)
let _ =
  (* functionn to register arguments *)
  let register_arg i = args := !args@[i] in
  (* each option -a INTEGER is considered as an argument *)
  Arg.parse ["-a",Arg.Int register_arg,"integer argument"] compile ""

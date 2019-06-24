let args = ref []
let compile file =
  print_string ("File "^file^" is being treated!\n");
  try
    let input_file = open_in file in
    let lexbuf = Lexing.from_channel input_file in
      while true do
        let pfx = PfxLexer.token lexbuf in
         match pfx with
	| PUSH -> Printf.printf "PUSH\n"
	| SWAP -> Printf.printf "SWAP\n"
	| POP -> Printf.printf "POP\n" 
	| ADD  -> Printf.printf "ADD\n" 
	| SUB -> Printf.printf "SUB\n" 
	| MUL -> Printf.printf "MUL\n" 
	| DIV -> Printf.printf "DIV\n" 
	| REM -> Printf.printf "REM\n"
	| INT(i)  -> Printf.printf "integer %d\n" i
	| eof   -> exit 0
	| _  ->	Location.print(Location.curr lexbuf);
      done
  with 
	|Sys_error s ->print_endline ("Can't find file '" ^ file ^ "'")

(*let file = /home/rudresh/Documents/MSC2/Language/project-skeleton/project/test_parser.pfx*)

(* Here we add the parsing of the command line and link to the main function *)
let _ =
  (* functionn to register arguments *)
  let register_arg i = args := !args@[i] in
  (* each option -a INTEGER is considered as an argument *)
  Arg.parse ["-a",Arg.Int register_arg,"integer argument"] compile ""

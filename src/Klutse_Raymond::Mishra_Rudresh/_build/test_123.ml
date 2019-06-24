(*Show the tokens the lexer received from the input file*)

let to_string = function 
| PUSH -> Printf.sprintf "PUSH" 
| SWAP -> Printf.sprintf "SWAP"
| POP -> Printf.sprintf "POP" 
| ADD  -> Printf.sprintf "ADD" 
| SUB -> Printf.sprintf "SUB" 
| MUL -> Printf.sprintf "MUL" 
| DIV -> Printf.sprintf "DIV" 
| REM -> Printf.sprintf "REM"


let compile file = 
 print_string ("File "^file^" is being treated!\n");
 try
  let input_file = open_in file in
  	let lexbuf = Lexing.from_channel input_file in
  		let rec write result = function 
			| EOF -> to_string EOF :: result |> List.rev 
			| x -> write (to_string x :: result) (PfxLexer.token lexbuf) 		
		in
			write [] (PfxLexer.token lexbuf) 
			|> String.concat " " 
			|> print_endline ; 
  close_in (input_file)
 with Sys_error s ->
  print_endline ("Can't find file '" ^ file ^ "'");;

let file = "/homes/m17nguy2/Bureau/Pfx_compiler/test/test_tokens_printing.pfx"
let result = compile file;;


{

(*Show the tokens the lexer received from the input file*)
let to_string = function 
| PUSH -> Printf.sprintf "PUSH" 
| INT(d) -> Printf.sprintf "INT(%d)" d
| SWAP -> Printf.sprintf "SWAP"
| POP -> Printf.sprintf "POP" 
| ADD  -> Printf.sprintf "ADD" 
| SUB -> Printf.sprintf "SUB" 
| MUL -> Printf.sprintf "MUL" 
| DIV -> Printf.sprintf "DIV" 
| REM -> Printf.sprintf "REM"
| EOF -> Printf.sprintf "EOF" 


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

let file = "/home/rudresh/Documents/MSC2/Language/project-skeleton/project/test_parser"
let result = compile file;;
}



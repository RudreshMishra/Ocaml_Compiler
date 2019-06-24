{
  open PfxParser

  let mk_int nb loc =
    try INT (int_of_string nb)
    with Failure _ -> raise (Location.Error(Printf.sprintf "Illegal integer '%s': " nb,loc))
}

let newline = (['\n' '\r'] | "\r\n")
let blank = [' ' '\014' '\t' '\012']
let not_newline_char = [^ '\n' '\r']
let digit = ['0'-'9']
let integer = digit+

rule token = parse
  (* newlines *)
  | newline { Location.incr_line lexbuf; token lexbuf }
  (* blanks *)
  | blank + { token lexbuf }
  (* end of file *)
  | eof      { EOF }
  (* comments *)
  | "--" not_newline_char*  { token lexbuf }
  (* integers *)
  | integer as nb           { mk_int nb (Location.curr lexbuf)}
  (* commands  *)
  (***** TO COMPLETE *****)
  | "push"      { PUSH }
  | "pop"       { POP }
  | "swap"      { SWAP }
  | "div"       { DIV }
  | "add"       { ADD }
  | "sub"       { SUB }
  | "mul" 	{ MUL }
  | "div" 	{ DIV }
  | "rem" 	{ REM }

(* lambda calcul and app *) 
  | "(" 	{LPAR}
  | ")" 	{RPAR}
  | "exec" 	{EXEC}
  | "get" 	{GET}

(*Support the let*) 

| "let" {LET}
| "=" {EQUAL} 
| "in" {IN}
| "if" {IF}
| "then" {THEN}
| "else" {ELSE}
| ";;" {END}
 


  (* illegal characters *)
  | _ as c  {
      	raise (Location.Error(Printf.sprintf "Illegal character '%c': " c ^"and the location is at "^Location.string_of (Location.curr lexbuf),Location.curr lexbuf));
    }

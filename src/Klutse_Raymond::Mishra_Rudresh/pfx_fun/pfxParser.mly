%{
  open PfxAst
  open Printf

  (* Ocaml code here*)
let xx = print_endline ("test -----") 

%}

/*(**************
 * The tokens *
 **************)*/

/*(* enter tokens here, they should begin with %token *)*/
%token PUSH POP SWAP ADD SUB MUL DIV REM
%token LAMBDA LPAR RPAR DOT
%token EXEC GET
%token EOF
%token <int> INT
%token <string> IDENT
%token <command list> INSTRSEQUENCE

/*(******************************
 * Entry points of the parser *
 ******************************)*/

/*(* enter your %start clause here *)*/
%start < PfxAst.program > program


%%

/*(*************
 * The rules *
 *************)*/

/*(* list all rules composing your grammar; obviously your entry point has to be present *)*/

/*(*program: i=INT EOF { i,[] }*)*/
program : 
	|i=args e=execute_command EOF			{ i,e}
	|i=args EOF 					{ i,[] }
args:
	| i=INT						{i}

execute_command:
	| e1 = command e2 = simple_expr e3= command	{ e1@e3@e2 }
	| e1 = command e2 = simple_expr			{ e1@e2 }
	| e1 = command					{ e1 }

command:
        | c=command e=express 				{ c@[e] }
        | e=express					{ [e] } 


express:
	|PUSH i=INT					{ Push i }
	|o=bop						{ o }
	|v=INSTRSEQUENCE 				{ Push v }

simple_expr:
  | LPAR e=express RPAR           			{ [e] }
  | EXEC          					{ Exec }
  | GET          					{ Get }

%inline bop:
  | POP      { Pop }
  | MUL      { Mul }
  | DIV      { Div }
  | REM      { Rem }
  | SWAP     { Swap }
  | ADD      { Add }
  | SUB      { Sub }
%%


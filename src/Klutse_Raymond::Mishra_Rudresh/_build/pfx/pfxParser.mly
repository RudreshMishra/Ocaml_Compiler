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
%token EOF
%token <int> INT

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
	|i=args e=command EOF				{ i,e}
	|i=args EOF 					{ i,[] }
args:
	| i=INT						{i}
command:
        | c=command e=express 				{ c@[e] }
        | e=express					{ [e] } 

express:
	|PUSH i=INT					{ Push i }
	|o=bop						{ o }

%inline bop:
  | POP      { Pop }
  | MUL      { Mul }
  | DIV      { Div }
  | REM      { Rem }
  | SWAP     { Swap }
  | ADD      { Add }
  | SUB      { Sub }
%%


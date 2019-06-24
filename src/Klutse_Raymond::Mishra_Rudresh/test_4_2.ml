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


open PfxAst
open Printf

type state = command list * int list

let string_of_stack stack = sprintf "[%s]" (String.concat ";" (List.map string_of_int stack))

let string_of_state (cmds,stack) =
  (match cmds with
   | [] -> "no command"
   | cmd::_ -> sprintf "executing %s" (string_of_command cmd))^
    (sprintf " with stack %s" (string_of_stack stack))

(* Question 4.2 *)
let step state =
  match state with
  | [], _ -> Error("Nothing to step",state)
  | (Add|Sub|Pop)::_, i::[] -> Error("Nothing to step",state)
  | (Add|Sub)::_, []->Error("Nothing to step",state)
  (* Valid configurations *)
  | Push(num):: q , stack            -> Ok (q, num::stack)
  | Push(num):: q , []            -> Ok (q, num::[])
  | Pop :: q , i::stack             -> Ok (q, stack)
  | Add :: q , i::j::stack          -> Ok (q, (i+j)::stack)
  | Sub :: q , i::j::stack          -> Ok (q, (i-j)::stack)
  | Mul :: q , i::j::stack          -> Ok (q, (i*j)::stack)
  | Div :: q , i::j::stack          -> Ok (q, (i/j)::stack)
  | Rem :: q , i::j::stack          -> Ok (q, (i mod j)::stack)
  | Swap :: q , i::j::stack         -> Ok (q, j::i::stack)


let eval_program (numargs, cmds) args =
  let rec execute = function
    | [], []    -> Ok None
    | [], v::_  -> Ok (Some v)
    | state ->
       begin
         match step state with
         | Ok s    -> execute s
         | Error e -> Error e
       end
  in
  if numargs = List.length args then
    match execute (cmds,args) with
    | Ok None -> printf "No result\n"
    | Ok(Some result) -> printf "= %i\n" result
    | Error(msg,s) -> printf "Raised error %s in state %s\n" msg (string_of_state s)
  else printf "Raised error \nMismatch between expected and actual number of args\n"

open ExprAst
open PfxAst

let rec generate = function
  | Const c -> " Push " ^ (string_of_int c)
  | Binop(op,e1,e2) -> (match op with
	|Badd -> generate e1 ^ generate e2 ^ " Add "
	|Bsub -> generate e1 ^ generate e2 ^ " Sub "
	|Bdiv -> generate e1 ^ generate e2 ^ " Div "
	|Bmul -> generate e1 ^ generate e2 ^ " Mul "
	|Bmod -> generate e1 ^ generate e2 ^ " Rem ")
  | Uminus e -> " PUSH " ^ (string_of_int 0) ^ generate e ^ " Sub "
  | Var v -> " PUSH " ^ v
;;


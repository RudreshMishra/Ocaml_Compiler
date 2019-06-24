open ExprAst
open PfxAst

let rec generate = function
  | Const c -> [Push  c]
  | Binop(op,e1,e2) -> (match op with
	|Badd -> (generate e1)@(generate e2)@[Add]
	|Bsub -> (generate e1)@(generate e2)@[Sub]
	|Bdiv -> (generate e1)@(generate e2)@[Div]
	|Bmul -> (generate e1)@(generate e2)@[Mul]
	|Bmod -> (generate e1)@(generate e2)@[Mod]
  | Uminus e -> (generate e)@(generate (Const 0))@[Sub]
  | Var v -> " PUSH " ^ v
  | Fun(id,e) -> [ Start ]@ generate e @[Exec]
  | App(e1,e2) -> [Exec] @ (generate e1 @ generate e2)
;;


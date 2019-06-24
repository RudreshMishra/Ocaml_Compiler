
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | SWAP
    | SUB
    | REM
    | PUSH
    | POP
    | MUL
    | INT of (
# 17 "pfx/pfxParser.mly"
       (int)
# 17 "pfx/pfxParser.ml"
  )
    | EOF
    | DIV
    | ADD
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState15
  | MenhirState3

# 1 "pfx/pfxParser.mly"
  
  open PfxAst
  open Printf

  (* Ocaml code here*)
let xx = print_endline ("test -----") 


# 50 "pfx/pfxParser.ml"

let rec _menhir_goto_command : _menhir_env -> 'ttv_tail -> _menhir_state -> (PfxAst.command list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ADD ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | DIV ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | EOF ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState15 in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, (i : (int))), _, (e : (PfxAst.command list))) = _menhir_stack in
        let _3 = () in
        let _v : (
# 24 "pfx/pfxParser.mly"
       ( PfxAst.program )
# 72 "pfx/pfxParser.ml"
        ) = 
# 37 "pfx/pfxParser.mly"
                          ( i,e)
# 76 "pfx/pfxParser.ml"
         in
        _menhir_goto_program _menhir_env _menhir_stack _v
    | MUL ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | POP ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | PUSH ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | REM ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | SUB ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | SWAP ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15

and _menhir_goto_express : _menhir_env -> 'ttv_tail -> _menhir_state -> (PfxAst.command) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState3 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (e : (PfxAst.command)) = _v in
        let _v : (PfxAst.command list) = 
# 43 "pfx/pfxParser.mly"
                        ( [e] )
# 106 "pfx/pfxParser.ml"
         in
        _menhir_goto_command _menhir_env _menhir_stack _menhir_s _v
    | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (e : (PfxAst.command)) = _v in
        let (_menhir_stack, _menhir_s, (c : (PfxAst.command list))) = _menhir_stack in
        let _v : (PfxAst.command list) = 
# 42 "pfx/pfxParser.mly"
                                  ( c@[e] )
# 117 "pfx/pfxParser.ml"
         in
        _menhir_goto_command _menhir_env _menhir_stack _menhir_s _v

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState3 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _10 = () in
    let _v : (PfxAst.command) = let o =
      let _1 = _10 in
      
# 54 "pfx/pfxParser.mly"
             ( Swap )
# 142 "pfx/pfxParser.ml"
      
    in
    
# 47 "pfx/pfxParser.mly"
             ( o )
# 148 "pfx/pfxParser.ml"
     in
    _menhir_goto_express _menhir_env _menhir_stack _menhir_s _v

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _10 = () in
    let _v : (PfxAst.command) = let o =
      let _1 = _10 in
      
# 56 "pfx/pfxParser.mly"
             ( Sub )
# 162 "pfx/pfxParser.ml"
      
    in
    
# 47 "pfx/pfxParser.mly"
             ( o )
# 168 "pfx/pfxParser.ml"
     in
    _menhir_goto_express _menhir_env _menhir_stack _menhir_s _v

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _10 = () in
    let _v : (PfxAst.command) = let o =
      let _1 = _10 in
      
# 53 "pfx/pfxParser.mly"
             ( Rem )
# 182 "pfx/pfxParser.ml"
      
    in
    
# 47 "pfx/pfxParser.mly"
             ( o )
# 188 "pfx/pfxParser.ml"
     in
    _menhir_goto_express _menhir_env _menhir_stack _menhir_s _v

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (i : (
# 17 "pfx/pfxParser.mly"
       (int)
# 205 "pfx/pfxParser.ml"
        )) = _v in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (PfxAst.command) = 
# 46 "pfx/pfxParser.mly"
                 ( Push i )
# 212 "pfx/pfxParser.ml"
         in
        _menhir_goto_express _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _10 = () in
    let _v : (PfxAst.command) = let o =
      let _1 = _10 in
      
# 50 "pfx/pfxParser.mly"
             ( Pop )
# 232 "pfx/pfxParser.ml"
      
    in
    
# 47 "pfx/pfxParser.mly"
             ( o )
# 238 "pfx/pfxParser.ml"
     in
    _menhir_goto_express _menhir_env _menhir_stack _menhir_s _v

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _10 = () in
    let _v : (PfxAst.command) = let o =
      let _1 = _10 in
      
# 51 "pfx/pfxParser.mly"
             ( Mul )
# 252 "pfx/pfxParser.ml"
      
    in
    
# 47 "pfx/pfxParser.mly"
             ( o )
# 258 "pfx/pfxParser.ml"
     in
    _menhir_goto_express _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_program : _menhir_env -> 'ttv_tail -> (
# 24 "pfx/pfxParser.mly"
       ( PfxAst.program )
# 265 "pfx/pfxParser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_1 : (
# 24 "pfx/pfxParser.mly"
       ( PfxAst.program )
# 273 "pfx/pfxParser.ml"
    )) = _v in
    Obj.magic _1

and _menhir_run12 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _10 = () in
    let _v : (PfxAst.command) = let o =
      let _1 = _10 in
      
# 52 "pfx/pfxParser.mly"
             ( Div )
# 287 "pfx/pfxParser.ml"
      
    in
    
# 47 "pfx/pfxParser.mly"
             ( o )
# 293 "pfx/pfxParser.ml"
     in
    _menhir_goto_express _menhir_env _menhir_stack _menhir_s _v

and _menhir_run13 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _10 = () in
    let _v : (PfxAst.command) = let o =
      let _1 = _10 in
      
# 55 "pfx/pfxParser.mly"
             ( Add )
# 307 "pfx/pfxParser.ml"
      
    in
    
# 47 "pfx/pfxParser.mly"
             ( o )
# 313 "pfx/pfxParser.ml"
     in
    _menhir_goto_express _menhir_env _menhir_stack _menhir_s _v

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and program : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 24 "pfx/pfxParser.mly"
       ( PfxAst.program )
# 332 "pfx/pfxParser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = let _tok = Obj.magic () in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    } in
    Obj.magic (let _menhir_stack = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (i : (
# 17 "pfx/pfxParser.mly"
       (int)
# 353 "pfx/pfxParser.ml"
        )) = _v in
        let _v : (int) = 
# 40 "pfx/pfxParser.mly"
              (i)
# 358 "pfx/pfxParser.ml"
         in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ADD ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | DIV ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | EOF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState3 in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, (i : (int))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 24 "pfx/pfxParser.mly"
       ( PfxAst.program )
# 378 "pfx/pfxParser.ml"
            ) = 
# 38 "pfx/pfxParser.mly"
                  ( i,[] )
# 382 "pfx/pfxParser.ml"
             in
            _menhir_goto_program _menhir_env _menhir_stack _v
        | MUL ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | POP ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | PUSH ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | REM ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | SUB ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | SWAP ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR)

# 57 "pfx/pfxParser.mly"
  


# 411 "pfx/pfxParser.ml"

# 219 "/usr/share/menhir/standard.mly"
  


# 417 "pfx/pfxParser.ml"

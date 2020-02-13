" syntax for ytt
" Author: cappyzawa <cappyzawa@yahoo.ne.jp>

let s:save_cpo = &cpo
set cpo&vim

function! YttEnter()
  if getline(".") =~ '^#@.*$'
    return "\<Esc>o#@ "
  else
    return "\<CR>"
  endif
endfunction

function! ytt#enable()
  if exists(':ALEDisable') != 0
    :ALEDisable
  endif
  setlocal comments=s1:#!
  setlocal commentstring=#!\ %s
  syn case match
  syn clear yamlComment
  syn region yttComment start="#!" end="$" contains=@Spell
  hi def link yttComment Comment

  let l:set_with_contained = 1
  call starlark#set_syntax(l:set_with_contained)

  syn match yttConditional "if/end" contains=starlarkConditional contained
  syn match yttRepeat "for/end" contains=starlarkRepeat contained
  syn match yttEnd "\<end\>" contained
  syn match yttSpecial "#@" contained
  syn match yttOperator "[+|=|!|:|\.]" contained
  syn match yttFunction "[A-Za-z_]*(" contained
  syn match yttFunction "[)|,]" contained
  syn match yttBlock "[{|}]" contained

  hi def link yttConditional Conditional
  hi def link yttRepeat Repeat
  hi def link yttEnd Statement
  hi def link yttSpecial Special
  hi def link yttOperator Operator
  hi def link yttFunction Function
  hi def link yttBlock Operator

  syn region yttStatement start="#@" end="$"
        \ contains=starlarkStatement,starlarkConditional,starlarkRepeat,starlarkOperator,starlarkType,starlarkBuitin,starlarkInclude,starlarkBlock,starlarkParen,starlarkString,,yttSpecial,yttConditional,yttRepeat,yttEnd,yttOperator,yttFunction,yttBlock
  highlight yttStatement guifg=Pink

  syn sync minlines=500

  imap <expr> <CR> YttEnter()
endfunction

function! ytt#disable()
  if exists(':ALEEnable') != 0
    :ALEEnable
  endif
  syn region  yamlComment         display oneline start='\%\(^\|\s\)#' end='$'
            \                   contains=yamlTodo
  syn clear yttComment
  syn clear yttStatement
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

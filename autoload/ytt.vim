" syntax for ytt
" Author: cappyzawa <cappyzawa@yahoo.ne.jp>

let s:save_cpo = &cpo
set cpo&vim

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

  syn region yttStatement start="#@" end="$"
        \ contains=starlarkStatement,starlarkConditional,starlarkRepeat,starlarkOperator,starlarkType,starlarkBuitin,starlarkInclude,starlarkBlock
  hi def link yttStatement Comment

  syn sync minlines=500
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

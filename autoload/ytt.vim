" syntax for ytt
" Author: cappyzawa <cappyzawa@yahoo.ne.jp>

let s:save_cpo = &cpoptions
set cpoptions&vim

function! ytt#enable()
  augroup YttSyntax
    autocmd!
    autocmd Filetype yaml :silent! call matchadd('YttLogic', '#@')
    autocmd Filetype yaml highlight YttLogic guibg=Red guifg=White
  augroup END
endfunction

function! ytt#disable()
  augroup YttSyntax
    autocmd!
  augroup END
endfunction

let &cpoptions = s:save_cpo
unlet s:save_cpo

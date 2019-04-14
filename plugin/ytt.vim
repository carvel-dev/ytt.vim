" syntax for ytt
" Author: cappyzawa <cappyzawa@yahoo.ne.jp>

if exists('g:loaded_ytt')
  finish
endif

let g:loaded_ytt = 1

let s:save_cpo = &cpoptions
set cpoptions&vim

" plugin code is here
command! -bar EnableYtt call ytt#enable()
command! -bar DisableYtt call ytt#disable()

nnoremap <silent> <Plug>(enable-ytt) :<C-u>EnableYtt<CR>
nnoremap <silent> <Plug>(disable-ytt) :<C-u>DisableYtt<CR>

if !exists('g:ytt_no_default_mapping')
  let g:ytt_no_default_mappings = v:false
endif
if !g:ytt_no_default_mappings
  nmap <Leader>ey <Plug>(enable-ytt)
  nmap <Leader>dy <Plug>(disable-ytt)
endif

let &cpoptions = s:save_cpo
unlet s:save_cpo

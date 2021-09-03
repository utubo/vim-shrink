if exists('g:loaded_vim_shrink')
  finish
endif
let g:loaded_vim_shrink = 1
let s:save_cpo = &cpo
set cpo&vim

let g:shrink_auto_restore = 1
let g:shrink_height = 5
let g:shrink_width = 10
nnoremap <silent> <Plug>(shrink-height) :<C-u>call shrink#height()<CR>
tnoremap <silent> <Plug>(shrink-height) <C-w>:call shrink#height()<CR>
nnoremap <silent> <Plug>(shrink-width) :<C-u>call shrink#width()<CR>
tnoremap <silent> <Plug>(shrink-width) <C-w>:call shrink#width()<CR>

let &cpo = s:save_cpo
unlet s:save_cpo

" example
"nmap <silent> <C-w><C-s> <Plug>(shrink-height)<C-w>w
"tmap <silent> <C-w><C-s> <Plug>(shrink-height)<C-w>w
"nmap <silent> <C-w><C-h> <Plug>(shrink-width)<C-w>w
"tmap <silent> <C-w><C-h> <Plug>(shrink-width)<C-w>w

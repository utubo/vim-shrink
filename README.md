⚠This is the beta version.

# vim-shrink
Shrink and restore the window

## Settings
### Example
```vim
nmap <silent> <C-w><C-s> <Plug>(shrink-height)<C-w>w
tmap <silent> <C-w><C-s> <Plug>(shrink-height)<C-w>w
nmap <silent> <C-w><C-h> <Plug>(shrink-width)<C-w>w
tmap <silent> <C-w><C-h> <Plug>(shrink-width)<C-w>w
```
### Options
```vim
" Restore when WinEnter. Default:1
let g:shrink_auto_restore = 1
" Default shrink size
let g:shrink_height = 5
let g:shrink_width = 10
```

### API
```vim
call shrink#height(<size>)
call shrink#width(<size>)
call shrink#restore_height(<size>)
call shrink#restore_width(<size>)
```

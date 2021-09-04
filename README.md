⚠This is the beta version.

# vim-shrink
Shrink and restore the window

![vim-shrink](https://user-images.githubusercontent.com/6848636/132008146-1b894282-96ed-404f-9e51-a7509537e040.gif)

## Install
```vim
call dein#add('utubo/vim-shrink')
```

## Settings
### Example
```vim
" ⚠This is the beta version !!
" I will change this mappings.
nmap <silent> <C-w><C-s> <Plug>(shrink-height)<C-w>w
tmap <silent> <C-w><C-s> <Plug>(shrink-height)<C-w>w
nmap <silent> <C-w><C-h> <Plug>(shrink-width)<C-w>w
tmap <silent> <C-w><C-h> <Plug>(shrink-width)<C-w>w
```
### Options
```vim
" Restore when WinEnter. (Default:1)
let g:shrink_auto_restore = 1
" Default shrink size
let g:shrink_height = 5
let g:shrink_width = 10
```

### API
```vim
" ⚠This is the beta version !!
" I will delete tehse api.
call shrink#height(<size>)
call shrink#width(<size>)
call shrink#restore_height(<size>)
call shrink#restore_width(<size>)
```

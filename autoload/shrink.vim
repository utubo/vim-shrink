" Common
function! s:IsAutoGrow(d) abort
  return winnr('$') == 2 && s:IsShrink(a:d, 1) + s:IsShrink(a:d, 2) == 1
endfunction

function! s:IsShrink(d, win = 0) abort
  return getwinvar(a:win, 'shrink_'.a:d, 0)
endfunction

" Shrink
function! s:Shrink(d, size) abort
  if winnr('$') < 2
    return
  endif
  if !exists('shrink_org_'.a:d) || !s:IsShrink(a:d) && !s:IsAutoGrow(a:d)
    let w:['shrink_org_'.a:d] = (a:d == 'w') ? winwidth(0) : winheight(0)
  endif
  let w:['shrink_'.a:d] = 1
  execute (a:d == 'w' ? 'vertical-resize ' : 'resize ') . a:size
  call s:RegisterEvents()
endfunction

function! shrink#width(size = -1) abort
  call s:Shrink('w', (a:size >= 0) ? a:size : g:shrink_width)
endfunction

function! shrink#height(size = -1) abort
  call s:Shrink('h', (a:size >= 0) ? a:size : g:shrink_height)
endfunction

" Restore
function! s:Restore(d, is_auto) abort
  if !s:IsShrink(a:d)
    return
  endif
  unlet w:['shrink_'.a:d]
  if a:is_auto && s:IsAutoGrow(a:d)
    return
  endif
  execute (a:d == 'w' ? 'vertical-resize ' : 'resize ') . w:['shrink_org_'.a:d]
  unlet w:['shrink_org_'.a:d]
endfunction

function! shrink#restore_width() abort
  call s:Restore('w', 0)
endfunction

function! shrink#restore_height() abort
  call s:Restore('h', 0)
endfunction

" Auto Restore
function s:AutoRestore()
  if !g:shrink_auto_restore
    return
  endif
  call s:Restore('h', 1)
  call s:Restore('w', 1)
endfunction

function! s:RegisterEvents()
  if exists('s:vim_shrink_rgstr_ev')
    return
  endif
  let s:vim_shrink_rgstr_ev = 1
  augroup vim_shrink
    au!
    au vim_shrink WinEnter * call <SID>AutoRestore()
  augroup END
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Rice GUI configuration loader
"
" Created by peromage 2021/03/14
" Last modified 2021/03/18
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let s:rt = {}

"-------------------------------------------------------------------------------
" Font
"-------------------------------------------------------------------------------
if rice#get_var('rice_gui_font', s:rt)
    let &guifont = s:rt.value
endif

"-------------------------------------------------------------------------------
" GUI configs
"-------------------------------------------------------------------------------
" Functions to check GUI configs
function! s:use_neovim_config() abort
    if exists('g:GuiLoaded')
        IncRiceGui neovimqt.vim
    elseif exists('g:fvim_loaded')
        IncRiceGui fvim.vim
    else
        return
    endif
endfunction

function! s:use_vim_config() abort
    if has('gui_running')
        IncRiceGui gvim.vim
    else
        return
    endif
endfunction

" Load GUI applications config
if rice#check_var('rice_gui_use_config')
    if has('nvim')
        call s:use_neovim_config()
    else
        call s:use_vim_config()
    endif
endif

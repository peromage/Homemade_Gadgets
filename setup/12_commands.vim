"===============================================================================
"
" Customized commands
"
" Created by peromage 2021/02/23
" Last modified 2021/02/23
"
"===============================================================================

"-------------------------------------------------------------------------------
" Close all but current buffers
"-------------------------------------------------------------------------------
command! Bdall :%bd|e#

"-------------------------------------------------------------------------------
" Toggle line numbers
"-------------------------------------------------------------------------------
command! LineNumbers :set nu rnu scl=yes
command! NoLineNumbers :set nonu nornu scl=no

"-------------------------------------------------------------------------------
" Toggle paste mode
"-------------------------------------------------------------------------------
command! PasteMode :set paste
command! NoPasteMode :set nopaste

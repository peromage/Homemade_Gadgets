"""""""""""""""""""""""""""""""""""""""
"" Created by peromage on 2020/08/02 ""
"""""""""""""""""""""""""""""""""""""""
""
"" ginit.vim template
"" Rename this file to "ginit.vim" or "gvimrc" and make your own changes in it
""

" Override these variables to control RC behaviors
"
"let g:RC_Gui_Font = "Cascadia Code PL:h10"

"#region Do Not Touch
" Shortcut to open this file
let s:GUI_INIT_FILE = expand("<sfile>:p")
command! RCGuiInitFile execute "edit ".s:GUI_INIT_FILE
" Load rc.vim
execute "source ".expand("<sfile>:h")."/__rc__/grc.vim"
"#endregion
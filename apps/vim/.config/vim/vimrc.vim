""
"" Created by peromage on 2020/06/04
""
"" RC entry file
""

" Guard for repeat loading
if get(g:, "RCINIT", 0) != 0
    echom "RC already loaded"
    finish
else
    let g:RCINIT = 1
endif

" Rc file root directory
let g:RCROOT = resolve(expand('<sfile>:h'))

" A helper function that dynamically loads .vim files by given directory
" and name patterns
function! g:RCLoadModules(path, patterns, ...) abort
    " @param path: Directory names
    " @param patterns: List of file glob patterns
    " @param ...: The third parameter is the default extension of module
    let l:ext = get(a:, 1, ".vim")
    for patt in a:patterns
        for mpath in globpath(a:path, patt.l:ext, 0, 1)
            execute "source ".mpath
        endfor
    endfor
endfunction

" A command that loads modules in __rcmodules__
command! -nargs=1 RCModule execute "source ".g:RCROOT."/__rcmodules__/"."<args>".".vim"

" RC main function
function! g:RCInit() abort
    " Set g:RC_Color to override default color scheme
    " This variable is a string
    if !exists("g:RC_Color")
        let g:RC_Color = "dracula"
    endif

     " Set g:RC_Global_Plugs to empty to prevent loading default plugins
    " Or customize the pre-configured plugins
    if !exists("g:RC_Global_Plugs")
        let g:RC_Global_Plugs = ["coc", "leaderf"]
    endif

    " Set g:RC_Local_Plugs to load cusmized plugins by users
    " This variable is a list of strings where each string is a vim-plug style
    " loading expression
    if !exists("g:RC_Local_Plugs")
        let g:RC_Local_Plugs = []
    endif

    " Start configuring

    " Add rc folder to runtime path
    execute "set runtimepath+=".g:RCROOT

    " Load color scheme
    execute "colorscheme ".g:RC_Color

    " Load all modules in rc directory
    call RCLoadModules(g:RCROOT."/__rc__", ["*"])

    " Load plugins via vim-plug
    call plug#begin()
    call RCLoadModules(g:RCROOT."/__rcplugs__", g:RC_Global_Plugs)
    for vppp in g:RC_Local_Plugs
        execute vppp
    endfor
    call plug#end()
endfunction

"""" Start initialization
call RCInit()

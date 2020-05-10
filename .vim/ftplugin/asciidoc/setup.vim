" From https://github.com/mjakl/vim-asciidoc/
" Fixed it so that it doesn't interpret every line starting with `=` as heading
" Removed conditional fold options
function! Foldexpr_asciidoc(lnum)
    let l0 = getline(a:lnum)
    if l0 =~ '^=\{1,5}\s\+\S.*$'
        return '>'.matchend(l0, '^=\+')
    else
        return '='
    endif
endfunc

setlocal foldexpr=Foldexpr_asciidoc(v:lnum)
setlocal foldmethod=expr

setlocal isfname-=#
nnoremap <leader><C-]> E?[\[,]?b-1<cr>:noh<cr><C-]>
nnoremap <leader>gf cgnlink:<C-r><C-o>".adoc[<C-r><C-o>"]<Esc>3b:e <cfile><cr>
"Set compiler

execute 'compiler asciidoc'

"Set tagbar

if exists("g:tagbar_type_asciidoc")
    finish
endif

packadd tagbar

TagbarOpen

let g:tagbar_type_asciidoc = {
    \ 'ctagsbin' : '/home/uvelichitel/.local/bin/ctags',
    \ 'ctagstype' : 'asciidoc',
    \ 'kinds' : [
        \ 'c:chapter',
        \ 's:section',
        \ 'S:subsection',
        \ 't:subsubsection',
        \ 'T:l4section',
        \ 'u:l5section',
        \ 'a:anchor',
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 'c' : 'chapter',
        \ 's' : 'section',
        \ 'S' : 'subsection',
        \ 't' : 'subsubsection',
        \ 'T' : 'l4subsection',
        \ 'u' : 'l5subsection',
        \ 'a' : 'anchor',
    \ },
    \ 'scope2kind' : {
        \ 'chapter' : 'c',
        \ 'section' : 's',
        \ 'subsection' : 'S',
        \ 'subsubsection' : 't',
        \ 'l4subsection' : 'T',
        \ 'l5subsection' : 'u',
        \ 'anchor' : 'a',
    \ },
\ }

set spell

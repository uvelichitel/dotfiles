if exists("g:tagbar_type_rust")
    finish
endif

" don't spam the user when Vim is started in Vi compatibility mode
let s:cpo_save = &cpo
set cpo&vim

function! s:SetTagbar()
    let g:tagbar_type_rust = {
      \ 'ctagsbin' : '/home/uvelichitel/.local/bin/ctags',
      \ 'ctagstype' : 'rust',
      \ 'kinds' : [
          \ 'n:modules',
          \ 's:structures:1',
          \ 'i:interfaces',
          \ 'c:implementations',
          \ 'f:functions:1',
          \ 'g:enumerations:1',
          \ 't:type aliases:1:0',
          \ 'v:constants:1:0',
          \ 'M:macros:1',
          \ 'm:fields:1:0',
          \ 'e:enum variants:1:0',
          \ 'P:methods:1',
      \ ],
      \ 'sro': ':',
      \ 'kind2scope' : {
          \ 'n': 'module',
          \ 's': 'struct',
          \ 'i': 'interface',
          \ 'c': 'implementation',
          \ 'f': 'function',
          \ 'g': 'enum',
          \ 't': 'typedef',
          \ 'v': 'variable',
          \ 'M': 'macro',
          \ 'm': 'field',
          \ 'e': 'enumerator',
          \ 'P': 'method',
      \ },
    \ }
endfunction

call s:SetTagbar()

" restore Vi compatibility settings
let &cpo = s:cpo_save
unlet s:cpo_save
" vim: sw=2 ts=2 et

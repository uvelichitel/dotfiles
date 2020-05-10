" Asciidoc compiler settings for Vim

if exists("b:current_compiler")
  finish
endif
let b:current_compiler = "asciidoc"

if exists(":CompilerSet") != 2
  command! -nargs=* CompilerSet setlocal <args>
endif

" don't spam the user when Vim is started in Vi compatibility mode
let s:cpo_save = &cpo
set cpo&vim


"CompilerSet makeprg=asciidoctor\ -r\ asciidoctor-pdf\ -b\ pdf\ -v
CompilerSet makeprg=asciidoctor\ -b\ docbook\ -v
CompilerSet shellpipe=2>

CompilerSet errorformat =%Easciidoctor:\ %tRROR:\ %f:\ line\ %l:\ %m
"CompilerSet errorformat+=%Easciidoctor:\ %tRROR:\ %f:\ %m
CompilerSet errorformat+=%Easciidoctor:\ FAILED:\ %f:\ line\ %l:\ %m
"CompilerSet errorformat+=%Easciidoctor:\ FAILED:\ %f:\ %m
CompilerSet errorformat+=%Wasciidoctor:\ %tARNING:\ %f:\ line\ %l:\ %m
"CompilerSet errorformat+=%Wasciidoctor:\ %tARNING:\ %f:\ %m
CompilerSet errorformat+=%Wasciidoctor:\ DEPRECATED:\ %f:\ line\ %l:\ %m
"CompilerSet errorformat+=%Wasciidoctor:\ DEPRECATED:\ %f:\ %m
CompilerSet errorformat+=%Iasciidoctor:\ INFO:\ %f:\ line\ %l:\ %m
"CompilerSet errorformat+=%Iasciidoctor:\ INFO:\ %f:\ %m
CompilerSet errorformat+=%Iasciidoctor:\ INFO:\ %m
CompilerSet errorformat+=%Wasciidoctor:\ DEBUG:\ %f:\ line\ %l:\ %m
"CompilerSet errorformat+=%Wasciidoctor:\ DEBUG:\ %f:\ %m
CompilerSet errorformat+=%Wasciidoctor:\ DEBUG:\ %m

" restore Vi compatibility settings
let &cpo = s:cpo_save
unlet s:cpo_save

" vim: sw=2 ts=2 et

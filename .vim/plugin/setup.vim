let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'
let g:gruvbox_italic=1
colorscheme gruvbox
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic
set spelllang=ru_yo,en_us
set spellfile=~/.vim/spell/techspeak.utf-8.add
set complete+=kspell
nn <F7> :setlocal spell! spell?<CR>
hi clear SpellBad
"hi SpellBad cterm=underline ctermfg=red ctermbg=none
hi SpellBad cterm=underline

highlight lCursor guifg=NONE guibg=Cyan

let g:tagbar_autofocus = 1
"let g:tagbar_autoclose = 1
let g:tagbar_ctags_bin = '/home/uvelichitel/.local/bin/ctags'
nnoremap <silent> <localleader>t :TagbarToggle<CR>

function! CleverTab()
  if pumvisible()
    return "\<C-N>"
  endif
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    return "\<Tab>"
  elseif exists('&omnifunc') && &omnifunc != ''
    return "\<C-X>\<C-O>"
  else
    return "\<C-N>"
  endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>
"inoremap <S-Tab> <C-x><C-O>

nnoremap <localleader><localleader> :AsyncRun
let g:asyncrun_exit = ":cnext"
let g:asyncrun_trim = 1
let g:asyncrun_save = 1
let g:asyncrun_rootmarks = ['.svn', '.git']
noremap <localleader>q :call asyncrun#quickfix_toggle(8)<cr>
nnoremap <silent> <localleader>8 :AsyncRun -program=grep <cword><CR>
nnoremap <localleader>/ :AsyncRun -program=grep
vnoremap <silent> <localleader>/ y:AsyncRun -program=grep '<C-r>"'<CR>
nnoremap <silent> <localleader>m :AsyncRun -program=make %<CR>

function! s:Note(...)
	exec ':cd /usr/home/uvelichitel/Notes'
	if a:0 != 0
		exec ':edit ' . a:1 . '.adoc'
		return
	endif
	try
		let output = system('fd -t f .  | dmenu -l 5 -c -i')
	catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
	endtry
	redraw!
		if v:shell_error == 0 && !empty(output)
    exec ':edit ' . output
	endif
endfunction
com! -nargs=? Note call <SID>Note(<f-args>)
nnoremap <leader>n :call <SID>Note()<CR>

fun! s:Scratch()
	exec "'<,'>w! >>" . "/usr/home/uvelichitel/Notes/scratch"
endfunc
com! -range Scratch call <SID>Scratch()
vnoremap <localleader>s :call <SID>Scratch()<CR>

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

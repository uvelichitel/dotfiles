syntax spell toplevel
for filetype in ['c', 'python', 'vim', 'javascript', 'typescript', 'cpp', 'sh', 'go']
	let ft=toupper(filetype)
	let group='textGroup'.ft
	if exists('b:current_syntax')
		let s:current_syntax=b:current_syntax
    " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
    " do nothing if b:current_syntax is defined.
	    unlet b:current_syntax
	endif
	execute 'syntax include @'.group.' syntax/'.filetype.'.vim'
	try
		execute 'syntax include @'.group.' after/syntax/'.filetype.'.vim'
		catch
	endtry
	if exists('s:current_syntax')
		let b:current_syntax=s:current_syntax
	else
		unlet b:current_syntax
	endif
	execute 'syntax region textSnip matchgroup=SpecialComment keepend start="\c\[source\s*,\s*'.filetype.'.*\]\s*\n[=-]\{4,\}\n" end="\]\@<!\n[=-]\{4,\}\n" contains=@'.group
endfor

set conceallevel=3
set concealcursor=nc



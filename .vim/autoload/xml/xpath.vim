function! xml#xpath#xidel(path) abort
	let output = systemlist('xidel --xml -e ' . a:path . ' -', winbufnr(winnr()))
	setlocal spr
	vnew
	setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile ft=xml
	call setline(1, output)
	"call setline(1, split(output, "\n"))
endfunction

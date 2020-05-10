" Copyright 2011 The Go Authors. All rights reserved.
" Use of this source code is governed by a BSD-style
" license that can be found in the LICENSE file.
"
" fmt.vim: Vim command to format Go files with gofmt.
"
" This filetype plugin add a new commands for go buffers:
"
"   :Fmt
"
"       Filter the current Go buffer through gofmt.
"       It tries to preserve cursor position and avoids
"       replacing the buffer with stderr output.
"
" Options:
"
"   g:go_fmt_commands [default=1]
"
"       Flag to indicate whether to enable the commands listed above.
"
"   g:gofmt_command [default="gofmt"]
"
"       Flag naming the gofmt executable to use.
"
if !exists("g:gofmt_command")
    let g:gofmt_command = "goimports 2>&1"
endif

function! go#fmt#imports()
    let view = winsaveview()
    silent execute "%!" . g:gofmt_command
    if v:shell_error
        let errors = []
        for line in getline(1, line('$'))
            let tokens = matchlist(line, '^\(.\{-}\):\(\d\+\):\(\d\+\)\s*\(.*\)')
            if !empty(tokens)
                call add(errors, {"filename": @%,
                                 \"lnum":     tokens[2],
                                 \"col":      tokens[3],
                                 \"text":     tokens[4]})
            endif
        endfor
        if empty(errors)
            % | " Couldn't detect gofmt error format, output errors
        endif
        undo
        if !empty(errors)
            call setqflist(errors, 'r')
        endif
        echohl Error | echomsg "Gofmt returned error" | echohl None
    endif
    call winrestview(view)
endfunction

if exists("b:did_ftplugin_go_commands")
  finish
endif

compiler go

setlocal shellpipe=>%s\ 2>&1
setlocal omnifunc=go#complete#complete

command! -buffer Godef call go#def#undercursor()
command! -buffer -range -nargs=1 Godefquery call go#def#query(<q-args>)

command! -buffer Gofmt call go#fmt#imports()

let b:did_ftplugin_go_commands = 1


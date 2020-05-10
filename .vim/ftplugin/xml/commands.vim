if exists("b:did_ftplugin_xml_commands")
  finish
endif

command! -buffer -nargs=1 XPath silent call xml#xpath#xidel(<f-args>)

let b:did_ftplugin_xml_commands = 1


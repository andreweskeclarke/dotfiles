if exists("b:current_syntax")
  finish
endif

syn match headerFile '[\.\/a-zA-Z_\-0-9]*\.h.*'
syn match cppFile '[\.\/a-zA-Z_\-0-9]*\.c.*'

let b:current_syntax = "cpplist"

hi def link headerFile PreProc
hi def link cppFile Statement


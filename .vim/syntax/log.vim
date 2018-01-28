if exists("b:current_syntax")
  finish
endif

" Integer with - + or nothing in front
syn match logInt '\d\+[,:]'
syn match logInt '[-+]\d\+[,:]'

syn match nonStartFilename '/[^:]*:'
syn match headerFile '[a-zA-Z]*\.h.*:'
syn match cppFile '[a-zA-Z]*\.cpp:'

syn keyword logResultsError error ERROR
syn keyword logResultsWarning warning Warning

syn match comments 'instantiated from '
syn match comments 'instantiated from here'
syn match comments 'note: '
syn match comments '\[ skipping .* contexts \]'

syn match logFilename '^/[^:]*:'
syn match logFilename2 '^[a-zA-Z\/]*\.[a-zA-Z]*:'

let b:current_syntax = "log"

hi def link logInt Constant
hi def link logFilename Type
hi def link comments Statement
hi def link logFilename2 Type
hi def link nonStartFilename PreProc
hi def link headerFile PreProc
hi def link cppFile PreProc
hi def link logResultsError Error
hi def link logResultsWarning Todo


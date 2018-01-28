
syn match nonStartFilename '/[^:]*:'
syn match headerFile '[a-zA-Z]*\.h.*:'
syn match cppFile '[a-zA-Z]*\.cpp:'

hi def link nonStartFilename PreProc
hi def link headerFile PreProc
hi def link cppFile PreProc

syn match heading '^Author:'
syn match heading '^Date:'
syn match heading '^commit '
syn match heading '^diff.*'
syn match heading '^index.*'
syn match heading '^@@.*'
syn match email '<[a-zA-Z]*@kcg.com>'
syn match jira '\[[A-Z]*-[0-9]*\]'
syn match shaKey '[a-z0-9]\{40}'
syn match add '^+.*'
syn match delete '^-.*'
syn match modified '^M\t.*'
syn match comments '\/\/.*'

hi def link email Constant
hi def link jira PreProc
hi def link shaKey Statement
hi def link heading Type

hi def link add PreProc
hi def link delete Constant
hi def link modified Special
hi def link comments Comment

let b:current_syntax = "gshow"

" vim: ts=8



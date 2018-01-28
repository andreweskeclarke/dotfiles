if exists("b:current_syntax")
  finish
endif

syn match heading '^Author:'
syn match heading '^Date:'
syn match heading '^commit '
syn match email '<[a-zA-Z]*@kcg.com>'
syn match jira '\[[A-Z]*-[0-9]*\]'
syn match shaKey '[a-z0-9]\{40}'
syn match add '^A\t.*'
syn match delete '^D\t.*'
syn match modified '^M\t.*'

hi def link email Constant
hi def link jira PreProc
hi def link shaKey Statement
hi def link heading Type

hi def link add Type
hi def link delete Special
hi def link modified Identifier


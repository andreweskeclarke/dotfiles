if exists("b:current_syntax")
  finish
endif

syn match timestamp '^[0-9]\{2}:[0-9]\{2}:[0-9]\{2}:[0-9]*'
syn match infoLog ' - Info'
syn match errorLog ' - Error'
syn match warnLog ' - Warn'
syn match passed '\.*passed'
syn match failed '\.*failed'
syn match testName '[a-zA-Z0-9_]*\.\.\.\.\.\.'

hi def link timestamp Constant
hi def link testName PreProc

hi def link infoLog Comment
hi def link warnLog Statement 
hi def link errorLog Special

hi def link passed Type
hi def link failed Error



if exists("b:current_syntax")
  finish
endif

syn match timestamp '^[0-9]\{2}:[0-9]\{2}:[0-9]\{2}:[0-9]*'
syn match infoLog ' - Info'
syn match infoLogNew '\[I\]'
syn match errorLog ' - Error'
syn match errorLogNew '\[E\]'
syn match warnLog ' - Warn'
syn match warnLogNew '\[W\]'
syn match passed '\.*passed'
syn match failed '\.*failed'
syn match testName '[a-zA-Z0-9_]*\.\.\.\.\.\.'
syn match integer '\<[0-9\.+-]*\>'
syn match tp '\<TP\>;[0-9*];[0-9]*;'
syn match fnxnStart '\<[^;]*_Start\>'
syn match timingPoint '\<[^;]*_tp\>'
syn match fnxnEnd '\<[^;]*_End\>'
syn match filename '\/[a-zA-Z0-9\._]*\.[a-z]*'

hi def link timestamp Constant
hi def link testName PreProc

hi def link infoLog Comment
hi def link infoLogNew Comment
hi def link warnLog Statement 
hi def link warnLogNew Statement 
hi def link errorLog Special
hi def link errorLogNew Special

hi def link passed Type
hi def link failed Error

hi def link filename Comment
hi def link fnxnStart Statement
hi def link timingPoint Type
hi def link fnxnEnd PreProc
hi def link integer Constant


execute pathogen#infect('~/.vim/bundle/{}')
syntax on
filetype plugin indent on
set number
set modeline
set tabstop=4
set softtabstop=0 
set expandtab 
set shiftwidth=4
set smarttab
set hlsearch
map <silent> <C-t> :NERDTreeToggle<CR>
map <silent> <S-R> :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$']
set runtimepath^=~/.vim/bundle/ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc

set number
set nowrap
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

cabbr <expr> %% expand('%:p:h')

set path+=$PLATFORM_INCLUDES

syntax enable

set background=dark
colorscheme elflord

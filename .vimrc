execute pathogen#infect()
syntax on
filetype plugin indent on
syntax on
set number
filetype indent plugin on
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


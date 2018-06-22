execute pathogen#infect('~/.vim/bundle/{}')
syntax on
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

set number
set modeline
set hlsearch
map <silent> <C-t> :NERDTreeToggle<CR>
map <silent> <S-R> :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$']
set runtimepath^=~/.vim/bundle/ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc

set number
set nowrap

cabbr <expr> %% expand('%:p:h')

set path+=$PLATFORM_INCLUDES

let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized


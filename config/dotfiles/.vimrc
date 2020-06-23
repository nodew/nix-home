set nocompatible
syntax enable

set termguicolors

" Limit escape key timeout
set ttimeout
set ttimeoutlen=100
set timeoutlen=3000

" Security and local execution
set exrc
set secure

" Tab settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set encoding=utf8
set number
set relativenumber
set smartindent
set autoindent
set wrap
set linebreak
" set wildmenu
" set lazyredraw
set showmatch
set noshowmode " lightline shows the status not vim
set showtabline=2
"set showcmd
"}}}

" Searching {{{
set incsearch
set hlsearch
set smartcase
set ignorecase
" }}}

" Folding {{{
set foldenable
set foldlevelstart=10
set foldnestmax=10
" }}}

set nobackup
set nowritebackup
set noswapfile
set hidden
set history=512
set path+=**
set splitbelow
set splitright

set diffopt=vertical

set completeopt=menu,menuone,preview,noselect,noinsert

let NERDTreeWinPos='left'
let NERDTreeWinSize=30
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>

set modeline
set modelines=5

" color scheme
colorscheme molokai

let mapleader=" "
let maplocalleader="-"

" nnoremap ; :
" nnoremap : ;
nnoremap <leader>r :source $MYVIMRC<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>
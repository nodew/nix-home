set nocompatible
let NERDTreeWinPos='left'
let NERDTreeWinSize=30
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>
set laststatus=2
syntax on
set background=dark
colorscheme molokai
syntax enable
set nu
set history=512
set relativenumber
set number
set autowrite
set autoread
set clipboard+=unnamed
set tags=./tags;$HOME

set modeline
set modelines=5
set nowritebackup
set nobackup
set directory=/tmp//
set hidden
set hlsearch
set ignorecase
set smartcase
set incsearch

set fo+=o " Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set fo-=r " Do not automatically insert a comment leader after an enter
set fo-=t " Do no auto-wrap text using textwidth (does not apply to comments)

set nowrap
set textwidth=0    " Don't wrap lines by default
set wildmode=longest,list " At command line, complete longest common string, then list alternatives.

set backspace=indent,eol,start  " more powerful backspacing

set tabstop=2    " Set the default tabstop
set softtabstop=2
set shiftwidth=2 " Set the default shift width for indents
set expandtab   " Make tabs into spaces (set by tabstop)
set smarttab " Smarter tab levels

set autoindent
set cindent
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do,for,switch,case

set showmatch  " Show matching brackets.
set matchtime=5  " Bracket blinking.
set novisualbell  " No blinking
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.
set vb t_vb= " disable any beeps or flashes on error
set ruler  " Show ruler
set cc=80
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

set showcmd " Display an incomplete command in the lower right corner of the Vim window
set shortmess=atI " Shortens messages

set nolist " Display unprintable characters f12 - switches
set listchars=tab:·\ ,eol:¶,trail:·,extends:»,precedes:« " Unprintable chars mapping

set foldenable " Turn on folding
set foldmethod=marker " Fold on the marker
set foldlevel=100 " Don't autofold anything (but I can still fold manually)
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds

set mouse-=a   " Disable mouse
set mousehide  " Hide mouse after chars typed

set splitbelow
set splitright

" normal key mapping
nnoremap <C-S-Up> ddP
nnoremap <C-S-Down> ddp
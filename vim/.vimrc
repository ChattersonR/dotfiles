set nocompatible " Not compatible with plain vi

syntax on
color industry
set t_vb=
set autoindent
set copyindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set shiftround
set smarttab
set backspace=2
set title
set noerrorbells
set visualbell
set ruler
set showcmd
set complete-=i
set completeopt=longest,menuone,preview
set viminfo=h,%,'50,"100,<10000,s1000,/1000,:1000
set history=1000
set undolevels=5000
if exists("&undofile")
    set undofile
endif
set showmatch
set incsearch
set ignorecase
set smartcase
set wrapscan
set nowrap
set linebreak
execute "set showbreak=\u2937"
execute "set listchars=tab:\u21C0\u21C0,trail:\uB7,extends:\u22EF,nbsp:_"
execute "set fillchars=fold:\u2501,vert:\u2502"
set list
set splitright
set splitbelow
set diffopt+=iwhite
set ttyfast
set lazyredraw
set noscrollbind
set formatoptions+=n
set backup
set backupdir=~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
set autoread
set hlsearch
set hidden
set timeoutlen=400
set ttimeoutlen=100
set noequalalways
set virtualedit=block
set updatecount=20
set scrolloff=2
set sidescrolloff=4
set sidescroll=1
set textwidth=0
set modelines=1
set display=lastline
set number
set t_Co=256


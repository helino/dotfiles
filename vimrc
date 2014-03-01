" COMPATABILITY
set nocompatible        " dont' care about vi compatability
set backspace=2         " fixes backspace for weird terminals
set encoding=utf-8

" VUNDLE
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'

" BUNDLES
Bundle 'helino/vim-json'
Bundle 'helino/vim-markdown'
Bundle 'helino/vim-nasm'
Bundle 'helino/vim-whitespace'
Bundle 'helino/vim-ftplugins'

filetype plugin indent on   " required by vundle

" INDENTATION
set tabstop=4           " tab is 4 spaces
set expandtab           " turn tab into spaces.
set smarttab            " replace tabs at beginning of line with spaces
set shiftwidth=4        " the width when pressing >>,<< or == and ai
set autoindent          " indent a new line equal to the one above.
set smartindent         " indent a new line after e.g. {

" LOOK
syntax enable           " use syntax highlightning
set background=dark     " use dark background
colorscheme desert      " use desert as default colorscheme
set showcmd             " show linecount in visual mode
set showmatch           " show matching parenthesis
set matchtime=1         " the time for showmatch
set laststatus=2        " always show the statusline

" SEARCH
set hlsearch            " Highlight search
set incsearch           " Incremental search, search as you type
set smartcase           " Ignore case when searching lowercase
set ignorecase          " Ignore case completely
set include-=i          " Do not search header files when autocompleting

" OPEN FILES
set wildchar=<Tab> wildmenu wildmode=full
set completeopt=menu,menuone,longest
set path+=**            " Add subdirectories to path
let g:netrw_liststyle = 3
let g:netrw_list_hide = ".hg"

set clipboard=unnamed   " Copy/paste should use the X11 clipboard
set nostartofline       " Return to the same position when changing tabs
set hidden              " Allow me to switch buffer without saving


" TAGS
    set tags=./tags;/

" MAPPINGS
    " ===============================================================
    " |      type       | normal | visual+select | operator-pending |
    " |-------------------------------------------------------------|
    " | noremap (map)   |   y    |       y       |         y        |
    " | nnoremap (nmap) |   y    |       -       |         -        |
    " | vnoremap (vmap) |   -    |       y       |         -        |
    " | onoremap (omap) |   -    |       -       |         y        |
    " ===============================================================
    let mapleader=','
    let maplocalleader='\'

    " ,space to turn on/off highlighted search
    nmap <silent><leader><space> :noh<cr>

    " easy copy/paste to clipboard
    map <leader>y "+y
    nmap <leader>p "+p

    " remap ESC to jj
    imap jj <Esc>

    " move between visual lines, not logical
    nmap j gj
    nmap k gk

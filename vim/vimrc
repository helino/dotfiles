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
    Bundle 'scrooloose/nerdcommenter'
    Bundle 'altercation/vim-colors-solarized'
    Bundle 'mileszs/ack.vim'
    Bundle 'Lokaltog/vim-powerline'
    Bundle 'kien/ctrlp.vim'
    Bundle 'helino/vim-json'
    Bundle 'helino/vim-markdown'
    Bundle 'helino/vim-nasm'
    Bundle 'helino/vim-whitespace'
    Bundle 'helino/vim-ftplugins'
    Bundle 'matchit.zip'
    Bundle 'sjl/splice.vim'
    Bundle 'vim-scipts/OmniCppComplete'

filetype plugin indent on   " required by vundle

" INDENTATION
    set tabstop=4           " tab is 4 spaces
    set expandtab           " turn tab into spaces.
    set smarttab            " replace tabs at beginning of line with spaces
    set shiftwidth=4        " the width when pressing >>,<< or == and ai
    set autoindent          " indent a new line equal to the one above.
    set smartindent         " indent a new line after e.g. {

" LOOK
    set t_Co=256            " enable 256 colors in terminals that support it
    syntax enable           " use syntax highlightning
    set bg=dark
    colorscheme solarized   " use solarized as default colorscheme
    call togglebg#map("")   " work around to enable the :ToggleBG command
    set showcmd             " show linecount in visual mode
    set showmatch           " show matching parenthesis
    set matchtime=1         " the time for showmatch
    set laststatus=2        " always show the statusbar
    set colorcolumn=80      " highlight column 80
    " make mispelled words red no matter the colorscheme
    highlight SpellBad ctermbg=none ctermfg=red

" SEARCH
    set hlsearch            " Highlight search
    set incsearch           " Incremental search, search as you type
    set smartcase           " Ignore case when searching lowercase
    set ignorecase          " Ignore case completely
    let g:ackprg="ack-grep -H --nocolor --nogroup --column" " ack setup
    let g:ctrlp_clear_cache_on_exit=0
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\.git$\|\.hg$\|\jtwork$\|\jtreport$\|\.*\webrev.*$\|\.*\build.*$',
        \ 'file': '\.out$\|\.so$\|\.class$\|\tags$\|\.o$\|\.o.d$\|\.rej$'
        \ }
    set grepprg=ack-grep\ -a

set clipboard=unnamed
set completeopt=menu,menuone,longest

let g:netrw_liststyle = 3
let g:netrw_list_hide = ".hg"

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

    " ,t to create a new tab in normal mode
    map <leader>t :tabnew<CR>

    " <C-h> and <C-l> to switch tabs
    map <C-h> :tabprevious<CR>
    map <C-l> :tabnext<CR>
    imap <C-h> <Esc>:tabprevious<CR>i
    imap <C-l> <Esc>:tabnext<CR>i

    " <C-j> to break the line at cursor
    nmap <NL> i<CR><RIGHT><ESC>

    " space to switch windows
    map <Space> <c-w>w

    " Search for the current word with ack
    map <C-a> :Ack<cr>

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

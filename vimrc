" COMPATABILITY
set nocompatible        " dont' care about vi compatability
set backspace=2         " fixes backspace for weird terminals
set encoding=utf-8

" INDENTATION
set tabstop=4           " tab is 4 spaces
set expandtab           " turn tab into spaces.
set smarttab            " replace tabs at beginning of line with spaces
set shiftwidth=4        " the width when pressing >>,<< or == and ai
set autoindent          " indent a new line equal to the one above.
set smartindent         " indent a new line after e.g. {

" LOOK
syntax off              " disable syntax highlightning
set background=dark     " use dark background
set showcmd             " show linecount in visual mode
set showmatch           " show matching parenthesis
set matchtime=1         " the time for showmatch
set laststatus=2        " always show the statusline
autocmd BufNewFile,BufRead *.json set ft=javascript " use js syntax for json
autocmd BufNewFile,BufRead *.md set ft=markdown " .md files are markdown
autocmd BufNewFile,BufRead *.make set ft=make " .make files are Makefiles
autocmd BufNewFile,BufRead *.gmk set ft=make " .gmk files are Makefiles

" based on http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight TrailingWhitespace ctermbg=red ctermfg=white
au ColorScheme * highlight TrailingWhitespace ctermbg=red ctermfg=white
au VimEnter * match TrailingWhitespace /\s\+$/
au BufWinEnter * match TrailingWhitespace /\s\+$/
au InsertLeave * match TrailingWhitespace /\s\+$/
au InsertEnter * match TrailingWhitespace /\s\+\%#\@<!$/


" FILE TYPE CONFIGS
autocmd FileType make setlocal noexpandtab list
autocmd FileType tex setlocal spell textwidth=79
autocmd FileType cpp setlocal ts=2 sw=2

" SEARCH
set hlsearch            " Highlight search
set incsearch           " Incremental search, search as you type
set smartcase           " Ignore case when searching lowercase
set ignorecase          " Ignore case completely
set include-=i          " Do not search header files when autocompleting
set grepprg=grep\ -H\ -R\ -n\ -I\ $*

" OPEN FILES
set wildchar=<Tab> wildmenu wildmode=longest:full,full
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
    " \space to turn on/off highlighted search
    nmap <silent><leader><space> :noh<cr>

    " remap ESC to jj
    imap jj <Esc>

    " move between visual lines, not logical
    nmap j gj
    nmap k gk

    " C-g to grep!
    nmap <C-g> :grep! <cword><cr>

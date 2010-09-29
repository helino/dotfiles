" BEGIN INDENTATION
set expandtab " Turn <TAB> into spaces.
set softtabstop=4 " Number of spaces <TAB> expands to
set shiftwidth=4 " The width when pressing >>,<< or == and ai
set autoindent " Indent a new line equal to the one above.

" BEGIN LOOK
syntax on " Use syntax highlightning
set number " Show line numbers to the left
colorscheme ir_black " Use ir_black as default colorscheme
set background=dark " Optimize for dark background
set ruler " Show line and column separated by a comma in lower right
set showcmd " Show linecount in visual mode

" BEGIN SEARCH
set hlsearch  " Highlight search
set incsearch  " Incremental search, search as you type
set smartcase " Ignore case when searching lowercase

" BEGIN COMPATABILITY
set backspace=2 " Fix backspace for strange terminals
autocmd BufRead,BufNewFile *.tex set wrapmargin=1 " Wrap lines in latex docs
" Saves additional stuff when saving a session
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize

" BEGIN KEYBOARD MAPPINGS
" <CTRL>-t to create a new tab (in both insert and normal mode)
map <C-t> :tabnew<CR>
imap <C-t> <ESC>:tabnew<CR>

" <CTRL>-(arrow key) to switch tab (in both insert and normal mode)
map <C-Left> :tabprevious<CR>
map <C-Right> :tabnext<CR>
imap <C-Left> <Esc>:tabprevious<CR>i
imap <C-Right> <Esc>:tabnext<CR>i

" <SPACE> to switch windows (in normal mode)
map <Space> <c-w>w

" <DASH> to turn on/off highlighted search
map <silent> - :silent noh<Bar>echo<CR> 

" BEGIN FILETYPE
filetype on " Enable filetype detection
filetype plugin on " Load plugins for specific filetypes
filetype plugin indent on " Use indentation based on filetype

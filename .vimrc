" search highlighting, to unhighlght :nohl
:set hlsearch
" show cursor line
:set cursorline

" tabs into spaces
:set expandtab
:set tabstop=4
:set shiftwidth=4
:set softtabstop=4
:set backspace=indent,eol,start

" pathogen setup
execute pathogen#infect()
syntax enable
filetype plugin indent on

" removing all trailing whitespace on InsertLeave
autocmd InsertLeave * :%s/\s\+$//e

" show line numbers, to hide, use :set nu!
:set number

" vim-airline
" show powerline even without split
:set laststatus=2

" switch off swp and backup files
set nobackup
set nowritebackup
set noswapfile

" enable colors/corporation color schema
colorscheme monokai
" use powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

" enable mouse cursor
:set mouse=a

:set completeopt=menu

" save on leave INSERT mode
imap <C-C> <Esc>:w<CR>

" switch tabs on J/K
map K <Esc>:tabnext<Enter>
map J <Esc>:tabprev<Enter>

" comment block of code
:vmap <C-X> I// <Esc><CR>
:map <C-N> :tabnew<Enter>

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>


" SHORTCUTS:
"   a                   - start insert mode after sign
"   i                   - start insert mode before sign
"   A                   - start insert mode in EOL
"   o                   - insert new line and start INSERT mode
"   Move:
"       w               - move cursor to begin of next word
"       e               - move cursor to end of next word
"       0               - move cursor to begin of line
"       G               - go to EOF
"       gg              - go to BOF
"       %               - go to end of braket
"       >>              - move block of code
"       z.              - put current line to center of screen
"   Edit:
"       u               - undo
"       U               - undo modifications in whole line
"       Ctrl-r          - redo
"       rx              - replace sign with x
"       R               - replace more than one sign
"       ce              - replace word
"       y-y             - copy line
"       yw              - copy word
"       Y               - copy line
"       p               - paste
"       v               - select text
"       Ctrl-v          - select block of text
"       I-#-Space       - add # in front of line
"   Select:
"       :'<,'>w TEST    - write selected text into TEST file
"       :r TEST         - paste content of TEST file into file
"       :r !ls          - paster ls STDOUT into file
"   Replace:
"       :s/old/new      - change old word to new
"       :#,#s/old/new/g - change old words to new in range from # to #
"       :%s/old/new/g   - change old word to new in whole file
"       :%s/old/new/gc  - change old word to new in whole file without asking
"   Deleting:
"       dd              - delete line
"       2dd             - delete 2 lines
"       dw              - delete word
"       2dw             - delete 2 words
"       d$              - delete to EOL
"   Tabs:
"       gt              - next tab
"   Splits:
"       Ctrl-w w        - switch to other split
"       Ctrl-w o        - close other splits
"       Ctrl-w +        - increase split size by 1 line
"       10 Ctrl-w +     - increase split size by 10 lines
"       Ctrl-w _        - maximize current split
"       Ctrl-w q        - close current split
"   Search:
"       *               - search for word currently under cursor
"       \pattern        - search for pattern in file
"       n               - jump to next search result
"   Folds:
"       zR              - open all folds
"       zM              - close all folds
"       zc              - close one fold
"       zo              - open one fold
"   Copying:
"       :put +          - paste to vim
"   Jedi:
"       \r              - rename
"       \g              - goto assignments
"       \d              - goto definitions
"       K               - show documentation
"       \n              - show usage
"       Ctrl-Space      - completion
"   CtrlP:
"      Ctrl-t           - open in new tab
"   Buffers:
"      :set autoread | checktime - refresh all buffers
"   Replace in project:
"      $ find . -name '*.html' -type f -exec sed -i -e 's/search/replace/g' -- {} +
"   Install vim with clipboard & python:
"      http://gustavepate.github.io/blog/20131010/compiling-vim-enable-python-system-copy-paste/
"      git clone  https://github.com/b4winckler/vim
"      ./configure --with-features=huge --enable-gui=gnome2 --enable-pythoninterp=yes --enable-cscope --enable-gui=auto --enable-gtk2-check --enable-gnome-check  --enable-fail-if-missing --enable-multibyte --enable-fontset --with-x --with-compiledby="GustavePate" --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/
"      sudo make install

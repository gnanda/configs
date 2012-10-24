"-> All Important
set nocompatible
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

"-> GuiOptions
if has('gui_running')
    set guioptions=ac
    if hostname() == 'thwomp'
        set guifont=peep\ 8
    else
        set guifont=peep\ 11
    endif
endif

"-> Make vim colorschemes work with Gnome-Terminal
if $COLORTERM == ('gnome-terminal' || 'xterm')
    set t_Co=256
endif

"-> StatusLine
set laststatus=2
set statusline=%f%m%r%=%02.v\|%03.l/%03.L

"-> General Niceities
"   -> autoread - automatically re-read file if it has changed outside the buffer
"   -> formatoptions - does many things to have vim auto format stuff for me
set mouse=n
set backspace=eol,indent,start
set autoread
set hidden
set history=500
set formatoptions=croql
set foldmethod=marker

" I hit these too often accidently, and this will save my sanity
map Q <Nop>
imap <C-w> <Nop>
cmap ` ~/


"-> Set my leader
let mapleader=","

"-> More mappings
noremap ' "
noremap " '
"   -> Space clears highlighting
noremap <silent> <Space> :silent nohl<Bar>echo<CR>
"   -> Movement
set scrolloff=4
set virtualedit=onemore
"   -> Between Panes - Maps C-w, direction to move to pane in that direction
map <silent>,h <C-w>h
map <silent>,j <C-w>j
map <silent>,k <C-w>k
map <silent>,l <C-w>l

"-> Files
"   -> UndoFile - allows for a persistant undo between sessions
"   -> nobackup - prevents vim from making a backup file before writing
"   -> dir      - where vim stores swap files
set undofile
set undodir=~/.vimlocal/undo
set nobackup
set dir=~/.vimlocal/swap

"-> Stuff on screen
set number
set nowrap
set ruler
set showmatch
set cursorline
"-> Color, Font, and Shape
syntax on
colorscheme jellybeans_noFontFX
hi Comment cterm=None gui=None
hi SpecialComment cterm=None gui=None
hi StatusLine cterm=None gui=None

"-> Setup wildmenu so that I can see my tab completion options
set wildmenu
set wildmode=list:longest
set wildchar=<Tab>

"-> Show invisibles
"   -> This shows
"       Trailing spaces
"       Empty lines with spaces
"       Also The foreground and background of these chars are set
set list listchars=tab:\|\ ,trail:¤,nbsp:¤
hi SpecialKey ctermbg=NONE
hi SpecialKey ctermfg=red guifg=red

"-> Tab Key
"   -> expandtab - use spaces inplace of tab characters, this setting will occasionally bite you in the ass
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent

"-> Searching
set incsearch
set hlsearch
set smartcase " Some tricks for mutt

"-> Spelling
set spelllang=en_us
set spell
"Toggle spell checker highlighting off initially
au Bufenter * TSpellHL
noremap <silent> <F3> :TSpellHL<cr>

"-> Plugins Galore
"-> Haskell Mode
let g:haddock_browser="/usr/bin/firefox"
let g:haddock_indexfiledir="~/.vimlocal"
au Bufenter *.hs compiler ghc

"-> Taglist
let Tlist_Ctags_Cmd="/usr/bin/ctags"
let Tlist_WinWidth=40
noremap <F2> :TlistToggle<cr>
noremap <F5> :TlistUpdate<cr>

"-> SuperTab
let g:SuperTabDefaultCompletionType="context"

"-> Perl-Support
    "I don't use the gui, this setting doesn't affect me either way
let g:Perl_LoadMenus='no'
    "Ctrl-j is for jumping to the next item in a template insertion, but I
    "already use it for split nav
let g:Perl_Ctrl_j='off'

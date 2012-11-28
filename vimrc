"-> All Important
set nocompatible
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

"--> General Niceities <------------------------------------------------------
"   autoread - automatically re-read file if it has changed outside the buffer
"   formatoptions - does many things to have vim auto format stuff for me
set mouse=n
set mousefocus
set mousehide
set backspace=eol,indent,start
set autoread
set hidden
set history=500
set formatoptions=croql
set foldmethod=marker
set switchbuf=usetab,split
"-> Shortmess
"   a = filmnrwx
"   help shortmess for more
set shortmess=aoOtI
runtime macros/matchit.vim

"--> Appearance <-------------------------------------------------------------
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

"-> Make window title useful for terminal vim
set title

"-> Stuff on screen
set number
set nowrap
set ruler
set showmatch
set cursorline
set pumheight=8

"-> Color, Font, and Shape
syntax on
colorscheme jellybeans_noFontFX
hi Comment cterm=None gui=None
hi SpecialComment cterm=None gui=None
hi StatusLine cterm=None gui=None

"-> Show invisibles
"   -> This shows
"       Trailing spaces
"       Empty lines with spaces
"       Also The foreground and background of these chars are set
set list listchars=tab:\|\ ,trail:¤,nbsp:¤
hi SpecialKey ctermbg=NONE
hi SpecialKey ctermfg=red guifg=red

"--> Mappings <---------------------------------------------------------------
" I hit these too often accidently, and this will save my sanity
map Q <Nop>
imap <C-w> <Nop>
cmap ` ~/

"-> Set my leader
let mapleader=","

"-> More mappings
noremap ' "
noremap " '
"-> Space clears highlighting
noremap <silent> <Space> :silent nohl<Bar>echo<CR>
"-> Movement
set scrolloff=4
set sidescrolloff=8
set virtualedit=onemore
"-> Between Panes - Maps leader-direction to move to pane in that direction
map <silent><leader>h <C-w>h
map <silent><leader>j <C-w>j
map <silent><leader>k <C-w>k
map <silent><leader>l <C-w>l

"-> Scroll 4 lines at a time
nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>

"Hide my list chars if I want
map <silent> <F4> :set nolist!<CR>

"Toggle spell checker highlighting off initially
au BufNewFile,BufReadPre,FilterReadPre,FileReadPre * TSpellHL
noremap <silent> <F3> :TSpellHL<cr>

"--> Other Stuff <------------------------------------------------------------
"-> Files
"   UndoFile - allows for a persistant undo between sessions
"   nobackup - prevents vim from making a backup file before writing
"   dir      - where vim stores swap files
set undofile
set undodir=~/.vimlocal/undo
set nobackup
set dir=~/.vimlocal/swap

"-> Setup wildmenu so that I can see my tab completion options
set wildmenu
set wildmode=list:longest
set wildchar=<Tab>

"-> Tab Key
"   expandtab - use spaces inplace of tab characters, this setting will occasionally bite you in the ass
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent

"-> Searching
set incsearch
set hlsearch
set smartcase

"-> Spelling
set spelllang=en_us
set spell

"->Filetype specific
au BufEnter *.tex set textwidth=100
au BufEnter *.tex set formatoptions=tcroql

"--> Plugins Galore <---------------------------------------------------------
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

"-> Symbols
let g:symbol_patterns = {}
let g:symbol_patterns.python = ['^\s*def\s\+\zs\w\+\ze', '^\s*class\s\+\zs\w\+\ze']
let g:symbol_patterns.perl = ['^\s*sub\s\+\zs\w\+\ze']

"-> SmartSwap
let g:SmartSwap_CheckDate = 1
let g:SmartSwap_CheckDiff = 1

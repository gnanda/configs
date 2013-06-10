"-> All Important
set nocompatible
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
runtime macros/matchit.vim
runtime macros/editexisting.vim

"--> General Settings <------------------------------------------------------
set autoread
set backspace=eol,indent,start
set foldmethod=marker
set formatoptions=croql
set hidden
set history=500
set mouse=n
set mousefocus
set mousehide
set nomore
set shortmess=aoOtI
set splitbelow
set splitright
set switchbuf=usetab,split
set matchpairs+=<:>,':',":"

"-> GuiOptions
if has('gui_running')
    set guioptions=act
    set ballooneval
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

"-> Make window title useful for terminal vim
set title

"-> Stuff on screen
set number
set nowrap
set ruler
set showmatch
set cursorline
set pumheight=8

"-> Movement
set scrolloff=4
set sidescrolloff=8
set virtualedit=onemore,block

"-> Files
set undofile
set undodir=~/.vimlocal/undo
set nobackup
set dir=~/.vimlocal/swap

"-> Setup wildmenu so that I can see my tab completion options
set wildmenu
set wildmode=list:longest
set wildchar=<Tab>

"-> Tab Key
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

"-> Vim auto escapes from insert after a while
"set updatetime=15000
"au CursorHoldI * stopinsert


"->Filetype specific
au BufEnter *.tex set textwidth=100
au BufEnter *.tex set formatoptions+=t

"-> Color, Font, and Shape
syntax on
colorscheme jellybeans_noFontFX
hi Comment cterm=None gui=None
hi SpecialComment cterm=None gui=None
hi StatusLine cterm=None gui=None

"-> MatchPairs doesn't look like cursor
hi clear MatchParen
hi MatchParen term=underline cterm=underline,bold gui=underline,bold

"-> Show invisibles
"   -> This shows
"       Trailing spaces
"       Empty lines with spaces
"       Also The foreground and background of these chars are set
set list listchars=tab:\|\ ,trail:¤,nbsp:¤
hi SpecialKey ctermbg=NONE guibg=NONE
hi SpecialKey ctermfg=black guifg=black

"-> StatusLine
set laststatus=2
set statusline=%1*#%n%*\ %f%2*%m%r%*\ %3*%y%*%=%02.v\|%03.l/%03.L
hi link User1 Number
hi link User2 Boolean
hi link User3 Identifier

"--> Mappings <---------------------------------------------------------------
"Note: More mappings may be in the plugins section
"-> Set my leader
let mapleader=","

"-> Leader Commands
nmap <silent><leader>c \\
nmap <silent><leader>C \\u
nmap <silent><leader>fs :NoTrail<cr>
nmap <silent><leader>sc :close<cr>
nmap <silent><leader>sh :split<cr>
nmap <silent><leader>sq :QFixToggle<cr>
nmap <silent><leader>sv :vsplit<cr>
nmap <silent><leader>tn :tabnew<cr>
nmap <silent><leader>tc :tabclose<cr>

" I hit these too often accidently, and this will save my sanity
map Q <Nop>
"imap <C-w> <Nop>

" This is genius, and set in my shell as well
cmap ` ~/

" Fix Search
vnoremap / /\v
nnoremap / /\v
vnoremap ? ?\v
nnoremap ? ?\v

" A proper use for arrow keys
nnoremap <down> :bprevious<CR>
nnoremap <up> :bnext<CR>
nnoremap <left> :tabnext<CR>
nnoremap <right> :tabprevious<CR>

"-> Flip usage of quotes
"noremap ' "
"noremap " '

"-> Space clears highlighting
noremap <silent> <Space> :silent nohl<Bar>echo<CR>

"-> Between Panes - Maps leader-direction to move to pane in that direction
map <silent><leader>h <C-w>h
map <silent><leader>j <C-w>j
map <silent><leader>k <C-w>k
map <silent><leader>l <C-w>l

"-> Scroll 4 lines at a time
nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>

"-> Up and Down on wraped lines
noremap j gj
noremap k gk

"Hide my list chars if I want
noremap <silent><F4> :set list!<CR>
inoremap <silent><F4> :set list!<CR>

"Toggle spell checker highlighting off initially
au BufNewFile,BufReadPre,FilterReadPre,FileReadPre * TSpellHL
noremap <silent><F3> :TSpellHL<cr>
inoremap <silent><F3> :TSpellHL<cr>

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

"-> Symbols
let g:symbol_patterns = {}
let g:symbol_patterns.python = ['^\s*def\s\+\zs\w\+\ze', '^\s*class\s\+\zs\w\+\ze']
let g:symbol_patterns.perl = ['^\s*sub\s\+\zs\w\+\ze']

"-> SmartSwap
let g:SmartSwap_CheckDate = 1
let g:SmartSwap_CheckDiff = 1

"-> Turn of Haskell-Conceal for the time being
let g:no_haskell_conceal = 1

"-> Ack.vim
if executable('ack') || executable('ag')
    if executable('ag')
        let g:ackprg="ag --nogroup --smart-case --follow"
    endif
    map <leader>/ :Ack
endif

"-> Indent Guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=black ctermbg=black

"-> Rainbow Parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"-> Syntastic
let g:syntastic_python_checkers=['pyflakes']

" vim configuration
" use :so ~/.vimrc to reload configuration

" ==================
" init
" ==================
" required for Vundle
set nocompatible              " be iMproved, required by Vundle
filetype off                  " required by Vundle

set rtp+=$HOME/.vim/bundle/Vundle.vim          " set the runtime path to include Vundle

" start Vundle
call vundle#begin('$HOME/.vim/bundle/') 

    Plugin 'VundleVim/Vundle.vim'               " let Vundle manage Vundle, required
    "Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'} " Incompatible with vim 32-bit!
    "Plugin 'bling/vim-airline'                  " Lean & mean status/tabline for vim

	" Color schemes
	" -------------
	Plugin 'sjl/badwolf'			" badwolf
	Plugin 'jnurmine/Zenburn'		" zenburn

	" Python indentations
	Plugin 'vim-scripts/indentpython.vim'

	" Syntax checking/highlighting
	Plugin 'scrooloose/syntastic'

	" File tree
	Plugin 'scrooloose/nerdtree'

	" Autocomplete
	Plugin 'Valloric/YouCompleteMe'

	" Lightline (additional status line)
	Plugin 'itchyny/lightline.vim'

	" Fugitive (git plugin)
	Plugin 'tpope/vim-fugitive'

	" Tagbar (code summary)
	Plugin 'majutsushi/tagbar'

	" vimtex - a latex plugin
	Plugin 'lervag/vimtex'

	" haskell filetype plugin
	Plugin 'neovimhaskell/haskell-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" ----------
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"  nerdtree
"  --------
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"  lightline
"  ---------
set noshowmode "don't show the mode on the standard statusline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ }

" YouCompleteMe and other completions
" -----------------------------------
set completeopt=preview,menuone,noselect

" to disable YouCompleteMe at start, uncomment below
"let g:loaded_youcompleteme = 1 

" blacklist
let g:ycm_filetype_blacklist = {
    \ 'tex' : 1,
    \ 'text' : 1
    \}
let g:ycm_autoclose_preview_window_after_completion=1
" map <leader>g to GoTo command
nnoremap <leader>g :YcmCompleter GoTo<CR>


" Syntastic
" ---------
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ["flake8", "pycodestyle"] "checkers to use
let g:syntastic_python_pycodestyle_args = "--ignore=E121,E123,E126,E133,E226,E241,E242,E704,W503,W504,W505,E501 --max-line-length=160" "pycodestyle args
let g:syntastic_python_flake8_args = "--max-line-length=160" "flake8 args

" below are the recomended settings for newbies from Syntastic doc
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}  " raises an error
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0 "Change to 1 to check on open.
let g:syntastic_check_on_wq = 0

" Errors shows errors location panel
nnoremap <leader>ee :Errors<CR> 
" lclose closes location panel
nnoremap <leader>lc :lclose<CR>


" Tagbar
" ------
nnoremap <F8> :TagbarToggle<CR>


" vimtex
" ------
" to disable vimtex uncomment line below
"let g:vimtex_enabled = 0

let g:vimtex_indent_enabled = 0  " disabled beacause it might be slow
let g:vimtex_compiler_method = 'latexrun'


" haskell-vim
" -----------
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

let g:haskell_indent_if = 4
let g:haskell_indent_case = 4
let g:haskell_indent_let = 4
let g:haskell_indent_where = 4
let g:haskell_indent_before_where = 4
let g:haskell_indent_after_bare_where = 4
let g:haskell_indent_do = 4
let g:haskell_indent_in = 4  " perhaps 1 or 0 is better?
let g:haskell_indent_guard = 4



"Colors
"======
"  For xterm 256 color numbers, see:
"  https://en.wikipedia.org/wiki/Xterm#/media/File:Xterm_256color_chart.svg
"
"  To use different settings for gui and for terminal:
"if has('gui_running')
"  set background=dark
"  colorscheme solarized
"else
"  colorscheme zenburn
"endif

"  Terminal colors
"  ---------------
if &term =~ '256color'
    "  If using vim through a terminal, without solarized, I need to set 256
    "  colors for xterm. This is not necessary if using solarize or if in gui
    "  mode.
    set t_Co=256

    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

"  Solarize colors
"  ---------------
" If using solarize:
"  Make terminal colors compatible with solarized, use if terminal does not
"  use solarized pallette. Not recommended, see solarized documentation under 
"  '3. Solarized Terminal Issues'.
"let g:solarized_termcolors=256

"  badwolf colors
"  --------------
"  Make the gutters darker than the background.
let g:badwolf_darkgutter = 1

syntax enable  " syntax highlighting

" For darker colors use background=dark
set background=dark

" Colorscheme 
" -----------
"  dark ones: desert, elflord, evening, industry, koehler, pablo, ron, slate, torte, solarized, badwolf, zenburn, default
colorscheme badwolf

"  Status line colors
"highlight StatusLine ctermbg=white ctermfg=236 "Statusline colors

"  Vertical split colors (set to be the same to hide the fill char)
"   In gui it is just a dark column.
highlight VertSplit ctermbg=236 ctermfg=236 guibg=#141413 guifg=#141413


" spell check
" -----------
" fg, bg for foreground, background colors, cterm=bold/italic/none (same for gui)
highlight SpellBad ctermfg=201 ctermbg=240 cterm=bold guifg=#FFFFFF guibg=#000000 gui=bold

" set spellcheck for tex
au BufNewFile,BufRead *.tex
    \ setlocal spell spelllang=en_us


"Spaces & Tabs
"=============
"  The following commented out due to vundle
"if has("autocmd")
"    filetype plugin indent on
"endif

"  Python tabs
"  TODO: move into python specific setting file
"  TODO: should it be setlocal?
au BufNewFile,BufRead *.py,*.tex
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=99 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

"  To flag unnecessary whitespace
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


" editing
" ==================
" make backspace behave normally
set backspace=indent,eol,start
set clipboard=unnamed        " use system clipboard
set encoding=utf-8           " utf-8 by default (required for python 3?)


" UI Config
" =========
set mouse=a    " Enable mouse
set ttymouse=sgr  "needed for the mouse to work on WSL
set showmatch  " Highlight matching [{()}]
set showcmd    " Show command in bottom bar
set wildmenu   " Visual autocomplete for command menu

set laststatus=2 " Enables lightline (extra status line)

set cursorline " Highlight current line, colors definition below.
highlight CursorLine cterm=NONE ctermbg=232 ctermfg=NONE

set colorcolumn=90 "A marked column to prevent going too far, color definition below.
highlight ColorColumn ctermbg=235

set number     "Line numbers, colors definitio below.
"highlight LineNr term=bold cterm=NONE ctermfg=DarkGray ctermbg=NONE 

set history=1000   "By default Vim saves your last 8 commands. We can handle more.
set incsearch      "Show match as search proceeds.
set hlsearch       "Highlight searched words.

" Set python syntax highlighting on figura (.fig) files
au BufNewFile,BufRead *.fig set filetype=python


"Keys 
"====
" Remember NO COMMENTS after key definitions.

"<leader>rr reloads vim config
nnoremap <leader>rr :source ~/.vimrc<CR>

" To cancel search with leader q
nnoremap <leader>q :nohlsearch<CR>

" Toggle NerdTree
noremap <F7> :NERDTreeToggle<CR>

" Next buffer
noremap <F6> :bn<CR>

" Previous buffer
noremap <S-F6> :bp<CR>

" Select mode
noremap <leader>s gh
noremap <leader>S gH
noremap <leader>b g<C-h>


" Insert Mode
" -----------
"  Select with Shift arrow keys
inoremap <S-Left> <Esc><Right>gh<S-Left>
inoremap <S-Right> <Esc><Right>gh<S-Right>
inoremap <S-Up> <Esc><Right>gh<Up>
inoremap <S-Down> <Esc><Right>gh<Down>

"  Move with Ctrl arrow keys
inoremap <C-Left> <S-Left>
inoremap <C-Right> <S-Right>
inoremap <C-Up> <S-Up>
inoremap <C-Down> <S-Down>

"  Word deletion
"  note: v makes selection inclusive <Esc>dvbi
"inoremap <C-BS> <C-W>
"inoremap <C-Del> <Esc><Right>dei
"inoremap <C-BS> <Esc>vbdi
"inoremap <C-Del> <Esc><Right>vedi


" Abbreviations
" =============
:ia ipdb import ipdb; ipdb.set_trace()

" Defined Above
" -------------
"  The following keys are defined above, but are shown here commented for completeness.
" map <leader>g to GoTo command
"nnoremap <leader>g :YcmCompleter GoTo<CR>

" Errors shows Syntactic errors location panel
"nnoremap <leader>ee :Errors<CR> 

" lclose closes location panel (errors)
"nnoremap <leader>lc :lclose<CR>

" Tagbar toggle
"nnoremap <F8> :TagbarToggle<CR>


" Commands
" ========
" lists all TODO comments in current directory and subdirectories
command Todo noautocmd vimgrep /TODO\|FIXME/j ** | cw


"GUI Config
"==========
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar for vertically split windows
:set guioptions-=l  "remove left-hand scroll bar


" Sounds
" ======
" stop the annoying chime
:set visualbell

" It's not 1976 anymore
set backspace=indent,eol,start
set softtabstop=4
set shiftwidth=4
set tabstop=4
set cursorline
set ttimeout
set number
set mouse=v
set laststatus=1
set ttimeoutlen=0
set matchtime=0
set list
set listchars=tab:›\ 
" Things I don't use.
let cfghome = $XDG_CONFIG_HOME
set directory=cfghome."/nvim/useless/swap/"
set backupdir=cfghome."/nvim/useless/bkp/"
set undodir=cfghome."/mvim/useless/undo/"

""" Plugins
call plug#begin('~/.nvim/plugged')
	Plug 'junegunn/rainbow_parentheses.vim'
	Plug 'neovimhaskell/haskell-vim'
	Plug 'easymotion/vim-easymotion'
	Plug 'junegunn/vim-easy-align'
	Plug 'elixir-lang/vim-elixir'
	Plug 'tpope/vim-unimpaired'
	Plug 'rust-lang/rust.vim'
	Plug 'tpope/vim-surround'
	Plug 'junegunn/vim-plug'
	Plug 'cespare/vim-toml'
	Plug 'kovisoft/slimv'
	Plug 'guns/vim-sexp'
	Plug 'kori/term.vim'
	Plug 'lervag/vimtex'
	Plug 'fatih/vim-go'
call plug#end()

" Colors
syntax on
colors term

" vim-easymotion
map / <Plug>(easymotion-sn)
set hlsearch!
hi link EasyMotionShade Comment
hi link EasyMotionTarget Search
hi link EasyMotionMoveHL Search
hi link EasyMotionHL Search

" rust.vim
let g:rust_recommended_style = 0

" vim-go
let g:go_fmt_command = "goimports"
let g:go_highlight_build_constraints = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" vimtex
let g:vimtex_view_general_viewer = "mupdf"

" haskell-vim
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_static_pointers = 1 
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_typeroles = 1

" rainbow_parentheses.vim
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END
let g:rainbow#blacklist = [6, 2]


""" Custom additions
" Set cursor to last known position
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\ exe "normal! g`\"" |
	\ endif

" Text bubbling
" Bubble single lines
nmap <C-k> [e
nmap <C-j> ]e
" Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv

" highlight files
au BufNewFile,BufRead *Pkgfile set filetype=sh  " Pkgfile

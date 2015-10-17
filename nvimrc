" It's not 1976 anymore
set backspace=indent,eol,start
set softtabstop=4
set shiftwidth=4
set tabstop=4
set encoding=utf8
set cursorline
set number
set tw=80
set list
set mouse=v
set listchars=tab:›\ 
set laststatus=1
set ttimeout
set ttimeoutlen=0

set matchtime=0
" Things I don't use.
set directory=~/.nvim/useless/swap/
set backupdir=~/.nvim/useless/bkp/
set undodir=~/.nvim/useless/undo/

""" Plugins
call plug#begin('~/.nvim/plugged')
	Plug 'kori/term.vim'
	Plug 'easymotion/vim-easymotion'
	Plug 'cespare/vim-toml'
	Plug 'tpope/vim-unimpaired'
	Plug 'raichoo/haskell-vim'
	Plug 'rust-lang/rust.vim'
	Plug 'tpope/vim-surround'
	Plug 'junegunn/vim-plug'
	Plug 'junegunn/vim-easy-align'
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

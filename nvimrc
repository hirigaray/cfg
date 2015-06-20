" It's not 1976 anymore
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set softtabstop=4
set number
set incsearch
set encoding=utf8
set cursorline
set linebreak
set tw=80

" Things I don't use.
set undodir=~/.nvim/useless/undo/
set backupdir=~/.nvim/useless/backup/
set directory=~/.nvim/useless/swp/

" Colors
syntax on
colors satori

" Plugins
call plug#begin('~/.nvim/plugged')
	Plug 'Lokaltog/vim-easymotion'
	Plug 'raichoo/haskell-vim'
	Plug 'Raimondi/delimitMate'
	Plug 'rust-lang/rust.vim'
	Plug 'fatih/vim-go'
	Plug 'kien/ctrlp.vim'
	Plug 'lervag/vimtex'
call plug#end()

""" Custom additions
" Set cursor to last known position
autocmd BufReadPost *
	\	if line("'\"") > 1 && line("'\"") <= line("$") |                      
	\	exe "normal! g`\"" |
	\	endif

" vim-easymotion
nmap f <Plug>(easymotion-s)

" vim-go
let g:go_fmt_command = "goimports"
let g:go_highlight_build_constraints = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1

" vimtex
let g:vimtex_view_general_viewer = "mupdf"

" haskell-vim
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_static_pointers = 1 
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_typeroles = 1

" highlight Pkgfiles
au BufNewFile,BufRead *Pkgfile set filetype=sh

" highlight toml
au BufNewFile,BufRead *toml set filetype=dosini

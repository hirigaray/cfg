" It's not 1976 anymore
set backspace=indent,eol,start
set shiftwidth=4
set softtabstop=4
set tabstop=4
set number
set encoding=utf8
set cursorline
set tw=80
set list
set listchars=tab:▸\ 

" Things I don't use.
set backupdir=~/.nvim/useless/backup/
set directory=~/.nvim/useless/swp/
set undodir=~/.nvim/useless/undo/

" Colors
syntax on
colors satori

""" Plugins
call plug#begin('~/.nvim/plugged')
	Plug 'easymotion/vim-easymotion'
	Plug 'tpope/vim-unimpaired'
	Plug 'raichoo/haskell-vim'
	Plug 'rust-lang/rust.vim'
	Plug 'tpope/vim-surround'
	Plug 'godlygeek/tabular'
	Plug 'kien/ctrlp.vim'
	Plug 'lervag/vimtex'
	Plug 'fatih/vim-go'
call plug#end()

" vim-easymotion
map  / <Plug>(easymotion-sn)

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

""" Custom additions
" Set cursor to last known position
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\ exe "normal! g`\"" |
	\ endif

" Text bubbling
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" highlight files
au BufNewFile,BufRead *Pkgfile set filetype=sh  " Pkgfile
au BufNewFile,BufRead *toml set filetype=dosini " toml

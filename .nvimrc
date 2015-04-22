" It's not 1976 anymore
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set softtabstop=4
set number
set incsearch
set encoding=utf8
set termencoding=utf-8
set cursorline
set linebreak
set tw=80

" Useless dirs
set undodir=~/.nvim/useless/undo/
set backupdir=~/.nvim/useless/backup/
set directory=~/.nvim/useless/swp/

" Colors
syntax on
colors satori

" Plugins
call plug#begin('~/.nvim/plugged')
Plug 'Raimondi/delimitMate'
Plug 'fatih/vim-go'
Plug 'wting/rust.vim'
Plug 'kien/ctrlp.vim'
"Plug 'itchyny/lightline.vim'
call plug#end()

" Lightline
" set laststatus=2
"let g:lightline = {
"	\ 'colorscheme': 'satori',
"	\ }

""" Custom additions
" Set cursor to last known position
autocmd BufReadPost *
	\	if line("'\"") > 1 && line("'\"") <= line("$") |                      
	\	exe "normal! g`\"" |
	\	endif

" highlight Pkgfiles
au BufNewFile,BufRead *Pkgfile set filetype=sh

" highlight toml
au BufNewFile,BufRead *toml set filetype=dosini

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_fail_silently = 1

" {{{ It's not 1976 anymore
set backspace=indent,eol,start
" }}}

" {{{ Plugins
call plug#begin('~/.nvim/plugged')
" {{{ plug itself and colorscheme
	Plug 'junegunn/vim-plug'
	Plug 'kori/term.vim'
" }}}

" {{{ language support
" {{{ lisp
	Plug 'guns/vim-sexp'
	Plug 'kovisoft/slimv'
	Plug 'junegunn/rainbow_parentheses.vim'
" }}}
" {{{ haskell
	Plug 'neovimhaskell/haskell-vim'
" }}}
" {{{ elixir
	Plug 'elixir-lang/vim-elixir'
" }}}
" {{{ go
	Plug 'fatih/vim-go'
" }}}
" {{{ toml
	Plug 'cespare/vim-toml'
" }}}
" }}}

" {{{ extra editing helpers
	Plug 'tpope/vim-unimpaired'
	Plug 'tpope/vim-surround'
	Plug 'easymotion/vim-easymotion'
" }}}
call plug#end()

" {{{ Plugin settings
" {{{ vim-go
let g:go_fmt_command = "goimports"
let g:go_highlight_build_constraints = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
" }}}
" {{{ haskell-vim
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_static_pointers = 1 
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_typeroles = 1
" }}}
" {{{ rainbow_parentheses.vim
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END
let g:rainbow#blacklist = [6, 2]
" }}}
" {{{ vim-easymotion
	map / <Plug>(easymotion-sn)
	set hlsearch!
	hi link EasyMotionShade Comment
	hi link EasyMotionTarget Search
	hi link EasyMotionMoveHL Search
	hi link EasyMotionHL Search
" }}}
" }}}
" }}}

" {{{ Tab settings
set softtabstop=4
set shiftwidth=4
set tabstop=4
" }}}

"{{{ Visual settings
syntax on
colors term
set cursorline
set number
set laststatus=1

set list
set listchars=tab:›\ 
" }}}

" {{{ Fold settings
set foldmethod=marker
" }}}

" {{{ Things I don't use
set mouse=v
let s:cfghome = $XDG_CONFIG_HOME
execute 'set directory=' . s:cfghome . '/nvim/useless/swap/'
execute 'set backupdir=' . s:cfghome . '/nvim/useless/bkp/'
execute 'set undodir=' . s:cfghome . '/nvim/useless/undo/'
" }}}

" {{{ Custom additions
" {{{ highlight files
au BufNewFile,BufRead *Pkgfile set filetype=sh " Pkgfile
" }}}
" {{{ Set cursor to last known position
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\ exe "normal! g`\"" |
	\ endif
" }}}
" {{{ Text bubbling
" Bubble single lines
nmap <C-k> [e
nmap <C-j> ]e
" Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv
" }}}
" }}}

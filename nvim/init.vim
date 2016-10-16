" {{{ It's not 1976 anymore
set backspace=indent,eol,start
let mapleader = "\<Space>"
" }}}

" {{{ Plugins
call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')
" {{{ plug itself and colorscheme
	Plug 'junegunn/vim-plug'
	Plug 'kori/term.vim'
" }}}

" {{{ language support
" {{{ scheme
	Plug 'kovisoft/paredit'
	let g:paredit_electric_return=0
	autocmd FileType scheme setlocal expandtab shiftwidth=2 softtabstop=2
	autocmd FileType scheme hi Delimiter ctermfg=black
	autocmd FileType scheme hi MatchParen ctermfg=darkmagenta
" }}}
" {{{ racket
	Plug 'wlangstroth/vim-racket'
" }}}
" {{{ clojure
	Plug 'guns/vim-clojure-static'
	let g:clojure_align_multiline_strings = 1
	let g:clojure_align_subforms = 1
" }}}
" {{{ haskell
	Plug 'neovimhaskell/haskell-vim'
" }}}
" {{{ elixir
	Plug 'elixir-lang/vim-elixir'
" }}}
" {{{ toml
	Plug 'cespare/vim-toml'
" }}}
" {{{ rust
	Plug 'rust-lang/rust.vim'
" }}}
" {{{ go
	Plug 'fatih/vim-go'
" }}}
" }}}

" {{{ extra editing helpers
	Plug 'tpope/vim-unimpaired'
	Plug 'tpope/vim-surround'
	Plug 'easymotion/vim-easymotion'
	Plug 'ap/vim-css-color'
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

"{{{ Tab settings
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
" {{{ Highlight unwanted spaces
	highlight ExtraWhitespace ctermbg=red guibg=red
	match ExtraWhitespace /\s\+$/
	autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
	autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
	autocmd InsertLeave * match ExtraWhitespace /\s\+$/
	autocmd BufWinLeave * call clearmatches()
" }}}
" {{{ icelight
	inoremap <A-l> <C-v>u3bb<Space>
	inoremap <A-f> <C-v>u192<Space>
	inoremap <A-h> <C-v>u3b1<Space>
	inoremap <A-t> <C-v>u3c9<Space>
" }}}
" }}}

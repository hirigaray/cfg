" {{{ It's not 1976 anymore
set backspace=indent,eol,start
let mapleader = "\<Space>"
" }}}

" {{{ Plugins
call plug#begin('/home/kori/.config/nvim/plugged')
" {{{ Plug itself and colorscheme
	Plug 'junegunn/vim-plug'
	Plug 'kori/vim-diesel'
" }}}
" {{{ Language support
" {{{ Lisp
	Plug 'kovisoft/paredit'
	let g:paredit_electric_return=0
	" {{{ Scheme
		autocmd FileType scheme setlocal expandtab shiftwidth=2 softtabstop=2
		autocmd FileType scheme hi Delimiter ctermfg=black
		autocmd FileType scheme hi MatchParen ctermfg=darkmagenta
	" }}}
	" {{{ Clojure
		Plug 'tpope/vim-fireplace'
		Plug 'tpope/vim-salve'
		Plug 'tpope/vim-classpath'
	" }}}
	" {{{ Racket
		Plug 'wlangstroth/vim-racket'
	" }}}
	" {{{ Go
		Plug 'fatih/vim-go'
	" }}}
	" {{{ Elixir
		Plug 'elixir-lang/vim-elixir'
	" }}}
	" {{{ Javascript
		Plug 'pangloss/vim-javascript'
	" }}}
	" {{{ Rust
		Plug 'rust-lang/rust.vim'
	" }}}
	" {{{ Flutter
		Plug 'dart-lang/dart-vim-plugin'
		Plug 'thosakwe/vim-flutter'
	" }}}
	" {{{ Miscellaneous
		Plug 'cespare/vim-toml'        " toml
		Plug 'baskerville/vim-sxhkdrc' " sxhkdrc
		Plug 'ekalinin/Dockerfile.vim' " Dockerfile
		Plug 'https://gitlab.exherbo.org/exherbo-misc/exheres-syntax' " Exhereses
		Plug 'neoclide/coc.nvim', {'branch': 'release'}

		autocmd FileType yaml setlocal expandtab shiftwidth=2 softtabstop=2 " YAML
	" }}}
	" }}}
" {{{ Extra editing helpers
		Plug 'tpope/vim-commentary'
		Plug 'tpope/vim-unimpaired'
		Plug 'tpope/vim-surround'
		Plug 'easymotion/vim-easymotion'
		Plug 'ap/vim-css-color'
" }}}
call plug#end()

" {{{ Plugin settings
" {{{ rust.vim
let g:rustfmt_autosave = 1
" }}}
" {{{ vim-go
	let g:go_fmt_command = "goimports"
	let g:go_highlight_build_constraints = 1
	let g:go_highlight_operators = 1
	let g:go_highlight_functions = 1
	let g:go_highlight_function_arguments = 1
	let g:go_highlight_function_calls = 1
	let g:go_highlight_operators = 1
	let g:go_highlight_methods = 1
	let g:go_highlight_structs = 1
" }}}
" {{{ easymotion
	map / <Plug>(easymotion-sn)
	set hlsearch!
	hi link EasyMotionShade Comment
	hi link EasyMotionTarget Search
	hi link EasyMotionMoveHL Search
	hi EasyMotionIncSearch ctermfg=2 cterm=underline
" }}}
" {{{ commentary
	autocmd FileType racket setlocal commentstring=;\ %s
	autocmd FileType rebol setlocal commentstring=;\ %s
" }}}
" {{{ sneak
	map f <Plug>Sneak_s
	map F <Plug>Sneak_S
	let g:sneak#label = 1
	autocmd Colorscheme * hi Sneak ctermbg=none ctermfg=15
	autocmd Colorscheme * hi SneakScope ctermbg=none ctermfg=0
" }}}
" }}}
" }}}
" }}}

"{{{ General settings
"{{{ Visual settings
	syntax on
	colors diesel

	set cursorline
	set number
	set laststatus=1

	set list
	set listchars=tab:›\ 
" }}}
"{{{ Tab settings
	set softtabstop=4
	set shiftwidth=4
	set tabstop=4
" }}}
" }}}

" {{{ Fold settings
	set foldmethod=marker
" }}}

"{{{ Things I don't use
	set mouse=v
	execute 'set directory=/home/kori/.config/nvim/useless/swap/'
	execute 'set backupdir=/home/kori/.config/nvim/useless/bkp/'
	execute 'set undodir=/home/kori/.config/nvim/useless/undo/'
" }}}

" {{{ Custom additions
" {{{ Highlight files
	au BufNewFile,BufRead *Pkgfile set filetype=sh
	au BufNewFile,BufRead *red set! filetype=rebol
	au BufNewFile,BufRead *Vagrantfile set filetype=ruby
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
" }}}

" {{{ It's not 1976 anymore
set backspace=indent,eol,start
let mapleader = "\<Space>"
" }}}

" {{{ Plugins
call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')
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
	" {{{ Shen
		Plug 'nimaai/vim-shen'
	" }}}
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
" {{{ Red
	Plug 'Prosumma/vim-rebol'
" }}}
" {{{ Rust
	Plug 'rust-lang/rust.vim'
" }}}
" {{{ Miscellaneous
	Plug 'cespare/vim-toml'        " toml
	Plug 'baskerville/vim-sxhkdrc' " sxhkdrc
" }}}
" }}}
" {{{ Extra editing helpers
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-unimpaired'
	Plug 'tpope/vim-surround'
	Plug 'easymotion/vim-easymotion'
	Plug 'ap/vim-css-color'
	Plug 'junegunn/goyo.vim'
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
	hi EasyMotionIncSearch ctermfg=2
" }}}
" {{{ commentary
	autocmd FileType racket setlocal commentstring=;\ %s
	autocmd FileType rebol setlocal commentstring=;\ %s
" }}}
" {{{ sneak
	let g:sneak#label = 1
	autocmd Colorscheme * hi Sneak ctermbg=none ctermfg=15
	autocmd Colorscheme * hi SneakScope ctermbg=none ctermfg=0
" }}}
" {{{ goyo
let g:goyo_linenr = 1

autocmd VimEnter * Goyo 80x100%

function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()
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
	let s:cfghome = $XDG_CONFIG_HOME
	execute 'set directory=' . s:cfghome . '/nvim/useless/swap/'
	execute 'set backupdir=' . s:cfghome . '/nvim/useless/bkp/'
	execute 'set undodir='   . s:cfghome . '/nvim/useless/undo/'
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

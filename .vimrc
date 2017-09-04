" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim



" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"
set number
set incsearch
set hlsearch
set termencoding=utf8
syntax on

"----------------------------------------------------------------------------------------------------
"foldings
"----------------------------------------------------------------------------------------------------
set foldenable
set foldmethod=syntax
set foldcolumn=3
set foldlevel=5
let php_folding=2

"----------------------------------------------------------------------------------------------------
"ofsets
"----------------------------------------------------------------------------------------------------
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
set autoindent

"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"----------------------------------------------------------------------------------------------------
"ultisnips
"----------------------------------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-n>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"let g:UltiSnipsEditSplit="vertical"
set runtimepath+=~/.vim/UltiSnips
let g:UltiSnipaSnippetDirectories=["~/.vim/UltiSnips"]

"----------------------------------------------------------------------------------------------------
"pathogen
"----------------------------------------------------------------------------------------------------
filetype off
call pathogen#helptags()
execute pathogen#infect('~/.vim/bundle/{}')
filetype plugin indent on

"----------------------------------------------------------------------------------------------------
"autosavefolding
"----------------------------------------------------------------------------------------------------
autocmd BufWinLeave * mkview
autocmd BufWinEnter * silent loadview

"----------------------------------------------------------------------------------------------------
"kirilica
"----------------------------------------------------------------------------------------------------

set langmap=йцукенгшщзфывапролдячсмитьЙЦУКЕНГШЩЗФЫВАПРОЛДЯЧСМИТЬ;qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor ctermfg=cyan


"----------------------------------------------------------------------------------------------------
"colorscheme
"----------------------------------------------------------------------------------------------------
set termguicolors
colorscheme angr


"----------------------------------------------------------------------------------------------------
"changes plugin
"----------------------------------------------------------------------------------------------------
let g:changes_autocmd=0

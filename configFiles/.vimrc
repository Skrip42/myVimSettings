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
set t_Co=256
set number
set incsearch
set hlsearch
set termencoding=utf8
syntax on

"----------------------------------------------------------------------------------------------------
"foldings
"----------------------------------------------------------------------------------------------------
set foldenable
set foldmethod=marker
set foldcolumn=3
set foldlevel=5
"set foldopen=mark,quickfix,search,tag,undo
let php_folding=2

autocmd InsertEnter * let w:last_fdm=&foldmethod | setlocal foldmethod=manual
autocmd InsertLeave * let &l:foldmethod=w:last_fdm

"----------------------------------------------------------------------------------------------------
"ofsets
"----------------------------------------------------------------------------------------------------
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set smarttab
"set smartindent
"set autoindent


" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"----------------------------------------------------------------------------------------------------
"pathogen
"----------------------------------------------------------------------------------------------------
filetype off
call pathogen#helptags()
execute pathogen#infect('~/.vim/bundle/{}')
filetype plugin indent on

"----------------------------------------------------------------------------------------------------
"ultisnips
"----------------------------------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"let g:UltiSnipsEditSplit="vertical"
set runtimepath+=~/.vim/UltiSnips
let g:UltiSnipaSnippetDirectories=["~/.vim/UltiSnips"]

"----------------------------------------------------------------------------------------------------
"autosave worckflow
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

"----------------------------------------------------------------------------------------------------
"tagbar plugin
"----------------------------------------------------------------------------------------------------
nmap <F9> : TagbarToggle<CR>


"----------------------------------------------------------------------------------------------------
"NERDTree plugin
"----------------------------------------------------------------------------------------------------
nmap <F8> :NERDTreeToggle<CR>

"----------------------------------------------------------------------------------------------------
"ConqueTerm plugin
"----------------------------------------------------------------------------------------------------
nmap <F5> :6sp \| ConqueTerm bash<CR>
nmap <F6> :6sp \| ConqueTerm python3<CR>
nmap <F7> :6sp \| ConqueTerm mysql -u root -p<CR>
"nmap <F10> :ConqueTermSplit bash<CR>
set splitbelow
"----------------------------------------------------------------------------------------------------
"syntastic plugin
"----------------------------------------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_php_phpcs_args='--tab-width=0'

set signcolumn=no
"----------------------------------------------------------------------------------------------------
"nerd commenter plugin
"----------------------------------------------------------------------------------------------------
map <C-_> <plug>NERDCommenterToggle
"----------------------------------------------------------------------------------------------------
"buftabline plugin
"----------------------------------------------------------------------------------------------------
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>


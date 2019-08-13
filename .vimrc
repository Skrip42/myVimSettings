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
"set t_Co=256
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

"----------------------------------------------------------------------------------------------------
"disabling swapfile
"----------------------------------------------------------------------------------------------------

set backupdir=~/.vimbackup
set directory=~/.vimswap
set undodir=~/.vimundo

 Source a global configuration file if available
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
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
set runtimepath+=~/.vim/UltiSnips
let g:UltiSnipaSnippetDirectories=["~/.vim/UltiSnips"]

"----------------------------------------------------------------------------------------------------
"autosave worckflow
"----------------------------------------------------------------------------------------------------
augroup AutoSaveFolds
  autocmd!
  " view files are about 500 bytes
  " bufleave but not bufwinleave captures closing 2nd tab
  " nested is needed by bufwrite* (if triggered via other autocmd)
  autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup end

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
autocmd vimenter *.php NERDTree
let NERDTreeShowHidden = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeQuitOnOpen=1   "uncoment this for enable close on open

"----------------------------------------------------------------------------------------------------
"ConqueTerm plugin
"----------------------------------------------------------------------------------------------------
nmap <F5> :12sp \| ConqueTerm bash<CR>
nmap <F6> :12sp \| ConqueTerm python3<CR>
nmap <F7> :12sp \| ConqueTerm mysql -u root -p<CR>
"nmap <F10> :ConqueTermSplit bash<CR>
set splitbelow
"----------------------------------------------------------------------------------------------------
"syntastic plugin
"----------------------------------------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
"let g:syntastic_mode_map = {'mode':'passive'}

let g:syntastic_php_phpcs_args='--tab-width=0'
"let g:syntastic_php_checkers = ['php'] "uncoment this to disable phpcs and phpmb

nnoremap <silent> <C-d> :lclose<CR>:bdelete<CR>
cabbrev <silent> bd <C-r>=(getcmdtype()==#':' && getcmdpos()==1 ? 'lclose\|bdelete' : 'bd')<CR>

set signcolumn=no

nmap <F10> :lopen<CR>

"----------------------------------------------------------------------------------------------------
"nerd commenter plugin
"----------------------------------------------------------------------------------------------------
map <C-_> <plug>NERDCommenterToggle
"----------------------------------------------------------------------------------------------------
"buftabline plugin
"----------------------------------------------------------------------------------------------------
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>
"----------------------------------------------------------------------------------------------------
"YouCompleteMe plugin
"----------------------------------------------------------------------------------------------------
let g:ycm_use_clangd = 0
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
"----------------------------------------------------------------------------------------------------
"ag plugin
"----------------------------------------------------------------------------------------------------
set runtimepath^=~/.vim/bundle/ag
let g:ag_working_path_mode="r"
let g:ag_lhandler="topleft vopen"
let g:ag_qhandler="copen 20"
let g:ag_apply_qmappings=0
let g:ag_highlight=1
let g:ag_prg="ag --column"
let g:unite_source_grep_default_opts =
    \ '-i --vimgrep --hidden --ignore ' .
    \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr''' .
    \ ''' --ignore ''.tmp.php'' --ignore ''.min.js'' --ignore ''.min.css'''


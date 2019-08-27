" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

"----------------------------------------------------------------------------------------------------
"syntax
"----------------------------------------------------------------------------------------------------
if has("syntax")
  syntax on
endif

"----------------------------------------------------------------------------------------------------
"base
"----------------------------------------------------------------------------------------------------
"set t_Co=256
set number
set incsearch
set hlsearch
set termencoding=utf8
syntax on
set updatetime=100
"set scl=yes

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

"set signcolumn=no
"open the syntastic bar
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
"toggle lest status
"----------------------------------------------------------------------------------------------------
function! LeftStatusToggle()
    :set invfoldenable
    :set invnumber
    :SignifyToggle
endfunction

nmap <F12> :call LeftStatusToggle()<CR>

"----------------------------------------------------------------------------------------------------
"signify plugin
"----------------------------------------------------------------------------------------------------
let g:signify_vcs_list = [ 'git', 'hg' ] 

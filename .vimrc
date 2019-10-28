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
set signcolumn=yes
"set scl=yes

"----------------------------------------------------------------------------------------------------
"foldings
"----------------------------------------------------------------------------------------------------
set foldenable
set foldmethod=marker
set foldcolumn=2
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
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
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
"autocmd vimenter *.php NERDTree
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
let g:syntastic_php_checkers = ['php', 'phpcs'] "uncoment this to disable phpcs and phpmb
let g:syntastic_php_phpcs_args='--standard=PSR2 -n'
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
let g:toggleStatus=1
function LeftStatusToggle()
    if g:toggleStatus == 1
        set foldcolumn=0
        set nonumber
        set signcolumn=no
        let g:toggleStatus = 0
    else 
        set foldcolumn=2
        set number
        set signcolumn=yes
        let g:toggleStatus = 1
    endif
endfunction

nmap <F3> :call LeftStatusToggle()<CR>
nmap <F2> :set invlist<CR>

"----------------------------------------------------------------------------------------------------
"signify plugin
"----------------------------------------------------------------------------------------------------
let g:signify_vcs_list = [ 'git', 'hg' ] 
"----------------------------------------------------------------------------------------------------
"airline plugin
"----------------------------------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='minimalist'
let g:airline#extensions#keymap#enabled = 0
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 0
let b:airline_whitespace_disabled = 1
let g:airline_section_x=''
let g:airline_skip_empty_sections = 1
"----------------------------------------------------------------------------------------------------
"gist plugin
"----------------------------------------------------------------------------------------------------
let g:gist_open_browser_after_post = 1
let g:gist_browser_command = 'google-chrome %URL%'
let g:github_user = 'Skrip42'
let g:github_token = '29f03ed2bce2cdfffa1eef805588264fdbe0d6c3'

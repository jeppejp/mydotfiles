set nocompatible              " be iMproved, required
filetype off                  " required
set shell=/bin/bash

" set termguicolors

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'vim-syntastic/syntastic'
Plug 'dense-analysis/ale'
Plug 'nightsense/plumber'
Plug 'dylanaraps/wal'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'chriskempson/base16-vim'
Plug 'neomake/neomake'
" Plug 'davidhalter/jedi-vim'
call plug#end()

set colorcolumn=120
set smartindent tabstop=4 shiftwidth=4 expandtab

set laststatus=2
set number
syntax on

" source ~/.config/nvim/colorscheme.vim
colo delek
hi MatchParen cterm=none ctermfg=red
hi Visual cterm=none ctermbg=red ctermfg=black
hi CursorLine cterm=none ctermbg=white ctermfg=black
hi Comment ctermfg=cyan

"""""""""""""""""""""""""""""""""""
" SYNTASTIC
" Default syntastic settings
" Open bottom window with :Error and close with :lclose
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_checkers = ['cpp/verapp', 'clang_tidy', 'cppcheck', 'gcc', 'make']
let g:syntastic_cpp_checkers = ['cpp/verapp', 'clang_tidy', 'cppcheck', 'gcc', 'make']
"let g:syntastic_python_checkers = ['python/pycodestyle']
let g:ale_python_pylint_options = "-d missing-function-docstring -d missing-module-docstring -d unused-import -d import-error -d wrong-import-position --max-line-length=120 -d missing-class-docstring -d unexpected-keyword-arg"
let g:ale_python_flake8_options = "--max-line-length=120 --ignore=F401,E302,E305"

"""""""""""""""""""""""""""""""""
"AIRLINE
" remove stuff from airline
let g:airline_section_warning = ''
let g:airline_section_error = ''
let g:airline_section_z = ''


"""""""""""""""""""""""""""""""""
" CTRL-P
" disable finding .git to set
" start directory

let g:ctrlp_working_path_mode = ''

"""""""""""""""""""""""""""""""""
" Highlight all search results
set hlsearch


"""""""""""""""""""""""""""""""""
" TAGS
" use autodir to find tags file
set tags=tags;


"""""""""""""""""""""""""""""""""
" VIM TIPS/CHEAT SHEET
let g:MyVimTips="off"
function! ToggleVimTips()
    if g:MyVimTips == "on"
        let g:MyVimTips="off"
        bd README.md
        pclose
    else
        let g:MyVimTips="on"
        pedit ~/git-repos/mydotfiles/README.md
    endif
endfunction
set previewheight=20
set splitbelow

"""""""""""""""""""""""""""""""""
" SHOW TAG IN POP UP WINDOW
let g:JjpTagShow="off"
function! ToggleTagShow()
    if g:JjpTagShow == "on"
        let g:JjpTagShow="off"
        pclose
    else
        let g:JjpTagShow="on"
        :exe "ptjump " . expand("<cword>")
    endif
endfunction


""""""""""""""""""""""""""""""""
" JSON format
com! JSONFormat %!python3 -m json.tool

"""""""""""""""""""""""""""""""""
" Man support
runtime! ftplugin/man.vim


"""""""""""""""""""""""""""""""""
" KEY MAPPINGS
map - :Explore<cr>
nnoremap <silent> <C-k> :!/usr/bin/tmux last-pane; /usr/bin/tmux send up enter; /usr/bin/tmux last-pane<CR><CR>
nmap q :bn!<cr>
nmap Q :bd<cr>
imap kk <Esc> 
nnoremap <C-b> :CtrlPBuffer<cr>
nnoremap <F5> :call ToggleTagShow()<CR>
nnoremap <F4> :call ToggleVimTips()<CR>
nnoremap m q
nnoremap <F9> :NERDTreeToggle<CR>
nnoremap <Space> :noh<cr> :pc<cr>
nnoremap <C-n> :cnext<cr>

set makeprg=/home/jjp/Executor/client.py\ ./waf

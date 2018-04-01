set nocompatible              " be iMproved, required
filetype off                  " required
set shell=/bin/bash

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-syntastic/syntastic'
Plug 'nightsense/plumber'
Plug 'dylanaraps/wal'
call plug#end()

set colorcolumn=120
" colo wal
set smartindent tabstop=4 shiftwidth=4 expandtab
map - :Explore<cr>
nmap q :bn!<cr>
nmap Q :bd<cr>
imap kk <Esc> 
nmap cpr O/* Copyright (c) 2013-2018 GomSpace A/S. All rights reserved. */<Esc>
nmap pcr O# Copyright (c) 2013-2018 GomSpace A/S. All rights reserved.<Esc>
nnoremap <C-b> :CtrlPBuffer<cr>

set laststatus=2
set number
syntax on


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
let g:syntastic_cpp_verapp_args = "-p gomspace"
let g:syntastic_python_checkers = ['python/pycodestyle']
let g:syntastic_python_pycodestyle_args = "--max-line-length=120 --ignore=E402"

"""""""""""""""""""""""""""""""""
"AIRLINE
" remove stuff from airline
let g:airline_section_warning = ''
let g:airline_section_error = ''
let g:airline_section_z = ''

" Highlight all search results
set hlsearch
nnoremap <Space> :noh<cr>

" use autodir to find tags file
set tags=tags;

" Map 'm' to recording
nnoremap m q

" set term=rxvt-unicode-256color

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
set previewheight=10
nnoremap <F4> :call ToggleVimTips()<CR>




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

nnoremap <F5> :call ToggleTagShow()<CR>

" :Man support
runtime! ftplugin/man.vim

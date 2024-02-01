set scrolloff=8
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
" disable the mouse
"set mouse=

set nocompatible

let g:do_filetype_lua = 1

" enable tru colors support
set termguicolors

let mapleader = " "

" Copy to clipboard
noremap <leader>y "+y
noremap <leader>p "+p

" Quickfix navigation
noremap <leader>qk :cprev<CR> 
noremap <leader>qj :cnext<CR> 
noremap <leader>qo :copen<CR> 
noremap <leader>qc :cclose<CR> 

lua require('rainbow')


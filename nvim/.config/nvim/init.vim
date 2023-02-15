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
nnoremap <leader>y "+y

lua require('rainbow')


source /home/greg/scripts/vim/hexmode

call plug#begin('~/.vim/plugged')
Plug 'drewtempelmeyer/palenight.vim'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

set guicursor=
set number

let g:airline_theme='violet'

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

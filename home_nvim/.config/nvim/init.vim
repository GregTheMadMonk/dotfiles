source /home/greg/scripts/vim/hexmode

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline-themes'
Plug 'aserebryakov/vim-todo-lists'
call plug#end()

set guicursor=
set number

set textwidth=0
set wrapmargin=0

let g:airline_theme='violet'

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

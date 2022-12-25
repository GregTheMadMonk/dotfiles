source /home/greg/scripts/vim/hexmode

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline-themes'
Plug 'mihaifm/vimpanel'
Plug 'aserebryakov/vim-todo-lists'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()

set number

set textwidth=0
set wrapmargin=0

let g:airline_theme='cobalt2'

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

map <C-Space>  :FZF .<CR>

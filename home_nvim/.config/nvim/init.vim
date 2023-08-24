call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'aserebryakov/vim-todo-lists'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'chrisbra/Colorizer'
Plug 'tikhomirov/vim-glsl'
Plug 'lukas-reineke/virt-column.nvim'
call plug#end()

set number

set colorcolumn=74,80
highlight ColorColumn ctermbg=256
lua require("virt-column").setup{ char = "┊" }

set textwidth=0
set wrapmargin=0

set tabstop=4
set shiftwidth=4
set expandtab

let g:airline_theme='cobalt2'

let g:indentLine_char="┊"

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

map <C-Space>  :FZF .<CR>

autocmd FileType gitcommit setlocal colorcolumn=50,72

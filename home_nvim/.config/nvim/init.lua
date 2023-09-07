-- Install plugins
require('lazy').setup {
    { 'vim-airline/vim-airline' },
    { 'vim-airline/vim-airline-themes' },
    { 'aserebryakov/vim-todo-lists' },
    { 'junegunn/fzf', build=':call fzf#install()' },
    { 'lukas-reineke/indent-blankline.nvim' },
    { 'chrisbra/Colorizer' },
    { 'tikhomirov/vim-glsl' },
    { 'lukas-reineke/virt-column.nvim' },
    { 'prabirshrestha/async.vim' },
    { 'nvim-treesitter/nvim-treesitter', build=':TSUpdate' },
    { 'Bekaboo/dropbar.nvim' }
}

-- Show line numbers
vim.opt.number = true

-- Enable treesitter highlighting and dropbar breadcrumbs
require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true
    }
}

-- Show 74th and 80th columns
vim.opt.colorcolumn = { 74, 80 }
require('virt-column').setup{ char = '┊' }
-- Transparent column BG (IDK how to set it from Lua)
vim.cmd('highlight ColorColumn ctermbg=256')
-- Show 50th and 72nd columns for git commit message
vim.api.nvim_create_autocmd('FileType', {
    pattern = "gitcommit",
    callback = function(args)
        vim.opt_local.colorcolumn = { 50, 72 }
    end
})

-- Don't automatically wrap text
vim.opt.textwidth = 0
vim.opt.wrapmargin = 0

-- Tab = 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Set up indent line
require('indent_blankline').setup{
    char = '┊',
    show_current_context = true,
}

-- Set up airline
vim.g.airline_theme = 'cobalt2'
vim.g.airline_left_sep = ''
vim.g.airline_left_alt_sep = ''
vim.g.airline_right_sep = ''
vim.g.airline_right_alt_sep = ''

--[[
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tabline#left_sep']= ' '
vim.g['airline#extensions#tabline#left_alt_sep'] = ''
]]--

-- Set up dropbar
local dbBar = require('dropbar.bar')
local dbSources = require('dropbar.sources')
local dbUtils = require('dropbar.utils')
require('dropbar').setup {
    bar = {
        sources = function(buf, _)
            return {
                dbUtils.source.fallback({
                    dbSources.treesitter,
                    dbSources.markdown,
                    dbSources.lsp
                })
            }
        end
    }
}

-- Keymappings
-- FZF
vim.keymap.set('n', '<Space><Space>', '<cmd>FZF .<cr>')
vim.keymap.set('n', '<C-Space>', '<cmd>FZF .<cr>')

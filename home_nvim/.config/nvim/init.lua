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
    { 'neovim/nvim-lspconfig' },
    { 'Bekaboo/dropbar.nvim' },
    { 'marrub--/vim-zscript' }
}

require('lspconfig').clangd.setup{
    cmd = { "clangd", "-j", "1" }
}

-- Show line numbers
vim.opt.number = true
vim.opt.relativenumber = true

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
require('ibl').setup{
    indent = {
        char = '┊'
    }
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
                    dbSources.lsp,
                    dbSources.treesitter,
                    dbSources.markdown,
                })
            }
        end
    }
}
vim.opt.mousemoveevent = true

-- Register .xx files as C++ sources
vim.cmd('autocmd BufNewFile,BufRead *.xx setfiletype cpp')

-- Keymappings
-- LSP
vim.keymap.set('n', '<Space>e', vim.diagnostic.open_float)
-- FZF
vim.keymap.set('n', '<Space><Space>', '<cmd>FZF .<cr>')
vim.keymap.set('n', '<C-Space>', '<cmd>FZF .<cr>')

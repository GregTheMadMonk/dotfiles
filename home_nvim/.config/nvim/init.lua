-- Install plugins
require('lazy').setup {
    -- Status line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    -- TODO in Vim. Barely ever used :)
    { 'aserebryakov/vim-todo-lists' },
    -- FZF file search and more
    { 'junegunn/fzf', build=':call fzf#install()' },
    { 'junegunn/fzf.vim' },

    { 'lukas-reineke/indent-blankline.nvim' },
    -- GLSL syntax highlighting
    { 'tikhomirov/vim-glsl' },
    -- Valve's ZScript syntax highlighting
    { 'marrub--/vim-zscript' },
    -- A columns limiter
    { 'lukas-reineke/virt-column.nvim' },
    -- Why is it here again?
    { 'prabirshrestha/async.vim' },
    -- LSP (I use clangd)
    { 'neovim/nvim-lspconfig' },
    -- Breadcrumbs
    { 'Bekaboo/dropbar.nvim' },
    -- Live editing together. Never actually used it
    { 'jbyuki/instant.nvim' },
    -- Flexing in Discord. For me personally, required a patch
    -- WARN: Don't open work files with Discord open. Even in VSCode with
    --       Neovim plugin. It starts sharing your work files names :|
    { 'andweeb/presence.nvim' },
    -- A very cool live Markdown preview in a browser
    {
        "iamcco/markdown-preview.nvim",
        cmd = {
            "MarkdownPreviewToggle",
            "MarkdownPreview",
            "MarkdownPreviewStop"
        },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    -- Treesitter for some other languages
    { 'nvim-treesitter/nvim-treesitter' },
}

-- Restrict clangd to one thread and enable inlay hints
require('lspconfig').clangd.setup{
    cmd = { "clangd", "-j", "1", "--inlay-hints=true" }
}

require('lspconfig').rust_analyzer.setup{}

-- Python lsp server
require('lspconfig').pylsp.setup{}

-- LSP hints borders
local _border = "double"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = _border
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = _border
  }
)

vim.diagnostic.config{
  float={border=_border, bg=None}
}

-- Discord FLEX
require('presence').setup({
    auto_update = true,
--  log_level = 'debug'
})

-- My nickname for live sharing
vim.g.instant_username = 'GregTheMadMonk'

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


-- Set up lualine
local segment_separator      = os.getenv('SEGMENT_SEPARATOR')
local segment_separator_alt  = os.getenv('SEGMENT_SEPARATOR_ALT')
local rsegment_separator     = os.getenv('RSEGMENT_SEPARATOR')
local rsegment_separator_alt = os.getenv('RSEGMENT_SEPARATOR_ALT')

local left_sep      = ''
local left_alt_sep  = ''
local right_sep     = ''
local right_alt_sep = ''

if segment_separator ~= nil then
    left_sep = segment_separator
    left_alt_sep = segment_separator_alt or segment_separator

    if rsegment_separator ~= nil then
        right_sep = rsegment_separator
        right_alt_sep = rsegment_separator_alt or rsegment_separator
    else
        right_sep = left_sep
        right_alt_sep = left_alt_sep
    end
end

require('lualine').setup{
    options = {
        icons_enabled = true,
        theme = 'base16',
        component_separators = {
            left  = left_alt_sep,
            right = right_alt_sep,
        },
        section_separators = {
            left  = left_sep,
            right = right_sep
        },
    },
}

-- Set up dropbar
local dbBar = require('dropbar.bar')
local dbSources = require('dropbar.sources')
local dbUtils = require('dropbar.utils')
require('dropbar').setup {
    bar = {
        enable = true,
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
-- Register .inc files as ASM sources
vim.cmd('autocmd BufNewFile,BufRead *.inc setfiletype asm')

-- Keymappings
---- LSP
------ clangd
vim.keymap.set('n', '<Space>e', vim.diagnostic.open_float)
vim.keymap.set(
    'n', '<Space>w', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end
)
vim.keymap.set('n', '<C-\\>', vim.lsp.buf.references)

---- FZF
vim.keymap.set('n', '<Space><Space>', '<cmd>Files .<cr>')
vim.keymap.set('n', '<C-Space>', '<cmd>Files .<cr>')

vim.keymap.set('n', '<Space>t', '<cmd>Buffers<cr>')

vim.keymap.set('n', '<Space>g', '<cmd>RG<cr>')

---- Markdown preview
vim.keymap.set('n', '<Space>p', '<cmd>MarkdownPreviewToggle<cr>')

-- "Stenographers" shortcuts
function steno(word, stenography)
    local len = #stenography
    local combinations = nil
    for i = 1, len do
        local temp = {}
        for j = 1, len do
            local c = stenography:sub(j, j)
            if combinations == nil then
                table.insert(temp, c)
            else
                for k, v in pairs(combinations) do
                    if not v:find(c) then
                        table.insert(temp, v..c)
                    end
                end
            end
        end
        combinations = {}
        for k, v in pairs(temp) do
            combinations[k] = v
        end
    end

    for k, v in pairs(combinations) do
        vim.keymap.set('i', v, word)
    end
end
-- vim.opt.timeoutlen = 15
-- steno('return', 're')
-- steno('true',   'tr')
-- steno('false',  'fa')
-- steno('False',  'FA')
-- steno('True',   'TR')

-- Color fixes
---- Set to default 16 terminal colors. Because, if I wanted to set up my
---- editor color scheme separately, I would've used GUI
vim.cmd('colorscheme vim')
vim.cmd('set notermguicolors')
---- Disable the horriblle highlight on floating windows
vim.api.nvim_set_hl(0, "NormalFloat", { bg="none" } )
---- Fix status line
vim.api.nvim_set_hl(0, "StatusLine", {reverse = false})
vim.api.nvim_set_hl(0, "StatusLineNC", {reverse = false})

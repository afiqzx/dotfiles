local global = vim.o
local kmap = vim.api.nvim_set_keymap


-- I don't know how to translate this to lua
-- Update: I did it!
--vim.g.gruvbox_number_column = 'bg1'
--vim.g.gruvbox_underline = '1'
vim.g.astro_typescript = 'enable'

vim.cmd'colorscheme tokyonight-night'

options = { noremap = true, silent = true }
--options = { noremap = true }          -- this is for debugging purpose (not silent)
-- kmap example below is just for eazy copy paste in the future
--kmap('n', '<left>', ':bp<CR>', options)

require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "rust", "cpp", "html", "css", "javascript", "astro" },

    sync_install = false,

    highlight = {
        enable = true,
    },
}





local global = vim.o
local kmap = vim.api.nvim_set_keymap

--vim.cmd'colorscheme gruvbox'
--vim.g.gruvbox_number_column = 'bg1'
--vim.g.gruvbox_underline = '1'
vim.cmd'colorscheme tokyonight-night'
--vim.cmd'colorscheme codedark'

options = { noremap = true, silent = true }
--options = { noremap = true }          -- this is for debugging purpose (not silent)
--kmap('n', '<left>', ':bp<CR>', options)

require'nvim-treesitter.configs'.setup {
    ensure_installed = { 
        "c",
        "lua",
        "rust",
        "cpp",
        "html",
        "css",
        "javascript",
        "astro",
    },

    sync_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}


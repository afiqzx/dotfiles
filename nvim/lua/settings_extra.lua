local global = vim.o
local kmap = vim.api.nvim_set_keymap

--vim.cmd'colorscheme gruvbox'
--vim.g.gruvbox_number_column = 'bg1'
--vim.g.gruvbox_underline = '1'
vim.cmd'colorscheme tokyonight-night'
--vim.cmd'colorscheme codedark'

options = { noremap = true, silent = true }
--options = { noremap = true }          -- this is for debugging purpose (not silent)

require'nvim-treesitter.configs'.setup {
    ensure_installed = { 
        "c",
        "cpp",
        "css",
        "html",
        "javascript",
        "lua",
        "rust",
        "vim",
        "vimdoc",
    },

    sync_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

require('lualine').setup()

-- projects with CMake(which have multiple Makefiles) will mess up the root directory
vim.g.rooter_patterns = {".git"}

-- for some reason jinja filetype is not suuported by nvim?
vim.filetype.add {
  extension = {
    jinja = 'jinja',
    jinja2 = 'jinja',
    j2 = 'jinja',
  },
}


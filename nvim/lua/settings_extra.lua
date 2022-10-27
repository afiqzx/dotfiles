local global = vim.o
local kmap = vim.api.nvim_set_keymap


-- I don't know how to translate this to lua
-- Update: I did it!
vim.g.gruvbox_number_column = 'bg1'
vim.g.gruvbox_underline = '1'

vim.cmd'colorscheme gruvbox'

options = { noremap = true, silent = true }
--options = { noremap = true }          -- this is for debugging purpose (not silent)
-- kmap example below is just for eazy copy paste in the future
--kmap('n', '<left>', ':bp<CR>', options)

-- we literally need completion-nvim just for this. YES I KNOW IT'S BLOATED
kmap('i', '<Tab>', '<Plug>(completion_smart_tab)', options)
kmap('i', '<S-Tab>', '<Plug>(completion_smart_s_tab)', options)
vim.cmd('autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif')

require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "rust", "cpp", "html", "css", "javascript" },

    sync_install = false,

    highlight = {
        enable = true,
    },
}



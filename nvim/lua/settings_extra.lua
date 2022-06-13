local global = vim.o
local kmap = vim.api.nvim_set_keymap

--local utils = require('gruvbox')

-- I don't know how to translate this to lua
vim.cmd'let g:gruvbox_number_column = \'bg1\''
vim.cmd'let g:gruvbox_underline = \'1\''

vim.cmd'autocmd vimenter * ++nested colorscheme gruvbox'


--options = { noremap = true, silent = true }
--options = { noremap = true }          -- this is for debugging purpose (not silent)
-- Switching buffers keymap (do I need this actually???)
--kmap('n', '<left>', ':bp<CR>', options)




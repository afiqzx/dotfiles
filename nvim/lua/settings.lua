local global = vim.o
local kmap = vim.api.nvim_set_keymap

-- use hybrid line numbering
global.relativenumber = true
global.number = true

-- insert space in tab
global.expandtab = true
global.shiftwidth = 4

-- enable mouse goodness
global.mouse = 'a'

-- somehow gruvbox doesnt work properly??
--global.termguicolors = true

options = { noremap = true, silent = true }
--options = { noremap = true }          -- this is for debugging purpose (not silent)
-- Switching buffers keymap (do I need this actually???)
kmap('n', '<left>', ':bp<CR>', options)
kmap('n', '<right>', ':bn<CR>', options)



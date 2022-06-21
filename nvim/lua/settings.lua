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

-- enable true color between alacritty, tmux and neovim
global.termguicolors = true

options = { noremap = true, silent = true }
--options = { noremap = true }          -- this is for debugging purpose (not silent)
-- Switching buffers keymap (do I need this actually???)
kmap('n', '<left>', ':bp<CR>', options)
kmap('n', '<right>', ':bn<CR>', options)

-- open omnicomplete easily in insert mode
kmap('i', '<leader>c', '<C-x><C-o>', options)


kmap('n', '<leader>f', ':Files<CR>', options)
kmap('n', '<leader>b', ':Buffers<CR>', options)
kmap('n', '<leader>w', ':Windows<CR>', options)
kmap('n', '<leader>e', ':Explore<CR>', options)
kmap('n', '<leader>t', ':Texplore<CR>', options)

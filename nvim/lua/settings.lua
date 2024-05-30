local global = vim.o
local kmap = vim.api.nvim_set_keymap

-- use hybrid line numbering
global.relativenumber = true
global.number = true

-- insert space in tab
global.expandtab = true
global.shiftwidth = 4
global.softtabstop = 4
global.tabstop = 4

-- enable mouse goodness
global.mouse = 'a'

-- enable true color between alacritty, tmux and neovim
global.termguicolors = true

options = { noremap = true, silent = true }
--options = { noremap = true }          -- this is for debugging purpose (not silent)
kmap('n', '<left>', ':bp<CR>', options)
kmap('n', '<right>', ':bn<CR>', options)

kmap('n', '<leader>f', ':Telescope find_files theme=dropdown<CR>', options)
kmap('n', '<leader>b', ':Telescope buffers theme=dropdown<CR>', options)
kmap('n', '<leader>g', ':Telescope live_grep theme=dropdown<CR>', options)
kmap('n', '<leader>e', ':Explore<CR>', options)
kmap('n', '<leader>t', ':Texplore<CR>', options)


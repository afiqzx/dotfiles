

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged/plug.vim')

-- status bar enchancement
Plug 'itchyny/lightline.vim'

-- color scheme
Plug 'morhetz/gruvbox'

vim.call('plug#end')

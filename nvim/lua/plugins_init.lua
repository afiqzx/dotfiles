local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged/plug.vim')

-- Good ol fzf and vi root ;)
-- This require you to install fzf manually
--Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

-- Snippet plugin
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-vsnip'

-- status bar enchancement
Plug 'itchyny/lightline.vim'

-- color scheme
Plug 'morhetz/gruvbox'

-- toml and yaml support
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'

-- Rust Support
Plug 'rust-lang/rust.vim'

-- Dart Support
Plug 'dart-lang/dart-vim-plugin'

-- lsp things
Plug 'neovim/nvim-lspconfig'
--Plug 'nvim-lua/lsp-status.nvim'  -- doesn't work. figure out later
Plug 'simrat39/rust-tools.nvim'

Plug 'nvim-treesitter/nvim-treesitter'

vim.call('plug#end')


local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged/plug.vim')

-- Good ol fzf and vi root ;)
-- This require you to install fzf manually
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

-- status bar enchancement
Plug 'itchyny/lightline.vim'

-- color scheme
Plug 'morhetz/gruvbox'

-- toml and yaml support
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'

-- Rust Support
Plug 'rust-lang/rust.vim'

-- lsp things
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim' -- is now public archive. but we need the smart tab for completion window
--Plug 'nvim-lua/lsp_extensions.nvim'
--Plug 'nvim-lua/lsp-status.nvim'  -- doesn't work. figure out later
Plug 'simrat39/rust-tools.nvim'

Plug 'nvim-treesitter/nvim-treesitter'

vim.call('plug#end')


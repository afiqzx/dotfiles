
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- basics
  use 'airblade/vim-rooter'
  use {
      'nvim-telescope/telescope.nvim',
      requires = {
          { 'nvim-tree/nvim-web-devicons', opt = false },
          { 'nvim-lua/plenary.nvim', opt = false },
      }
  }
  use 'nvim-treesitter/nvim-treesitter'
  use 'folke/tokyonight.nvim'

  use 'neovim/nvim-lspconfig'

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-nvim-lsp'

  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = false }
  }

  use 'cespare/vim-toml'
  use 'stephpy/vim-yaml'

  -- THE OG LETSSGOOOOOO
  use 'tpope/vim-fugitive'

  use 'slint-ui/vim-slint'
  --use 'mrcjkb/rustaceanvim'  -- on a side note I don't want this, will cause conflict with my LSP setup
  --use 'rust-lang/rust.vim' -- Don't think we need this

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)


-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

  -- basics
  'nvim-tree/nvim-web-devicons',
  'nvim-lua/plenary.nvim',
  'airblade/vim-rooter',
  
  'nvim-telescope/telescope.nvim',
  'nvim-treesitter/nvim-treesitter',
  'folke/tokyonight.nvim',

  'neovim/nvim-lspconfig',

  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'hrsh7th/cmp-nvim-lsp',

  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',

  
  'nvim-tree/nvim-web-devicons',
  'nvim-lualine/lualine.nvim',

  'cespare/vim-toml',
  'stephpy/vim-yaml',

  -- THE OG LETSSGOOOOOO
  'tpope/vim-fugitive',

  'slint-ui/vim-slint',
})

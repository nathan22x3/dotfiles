return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- color schemes
  use 'ellisonleao/gruvbox.nvim'

  -- dev essentials
  use { 'neoclide/coc.nvim', branch = 'release' }

  -- helpers
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
end)

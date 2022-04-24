local fn = vim.fn
print("plugin loaded")
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PackerBootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup({function (use)
  -- Make Packer manage itself
  use { 'nvim-lua/plenary.nvim' }
  use { 'wbthomason/packer.nvim' }
  use { '9mm/vim-closer' }
  use { 'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  config = function ()
    require("plugins.treesitter")
  end}
  use { 'tversteeg/registers.nvim', keys = { { 'n', '"' }, { 'i', '<c-r>' } } }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    -- tag = 'release' -- To use the latest release
    config = function ()
      require('gitsigns').setup()
    end
  }

  -- better QuickFix window for NeoVim
  use { 'kevinhwang91/nvim-bqf' }



  ---------------------------------------------------------------------------
  -- Visuals
  ---------------------------------------------------------------------------

  use { 'kyazdani42/nvim-web-devicons' }
  use { 'luochen1990/rainbow' }
  use { 'ellisonleao/gruvbox.nvim' }

  -- Indentation tracking
  use { 'lukas-reineke/indent-blankline.nvim'}

  -- A tab bar
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
    config= function () require('plugins.barbar') end
  }

  -- -- A statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      'SmiteshP/nvim-gps'
    },
    config= function () require('plugins.lualine') end
  }

  -- Sway i3 config highlighting
  use { 'mboughaba/i3config.vim' }

  -- Cool startup Screen
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
      require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  }

  -- CMAKE syntax support
  use { 'pboettch/vim-cmake-syntax'}


  ---------------------------------------------------------------------------
  -- Functionality
  ---------------------------------------------------------------------------

  -- Complete LSP package and more
  use {
    'neoclide/coc.nvim',
    branch = 'release',
    config = function ()
      require('plugins.coc').setup()
    end
  }

  -- Find, Filter, Preview, Pick. All lua, all the time.
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    wants = { 'plenary.nvim' },
    config = function ()
      require("plugins.telescope")
    end,
    module = 'telescope'
  }

  -- Documentation
  use {
    'danymat/neogen',
    requires = 'nvim-treesitter',
    config = [[require('plugins.neogen')]],
    -- keys = { '<localleader>d', '<localleader>df', '<localleader>dc' },
  }

  -- FuGITive
  use { 'tpope/vim-fugitive' }

  -- move visual selection
  use { 'Jorengarenar/vim-MvVis'}

  -- run common Unix commands inside Vim
  use { 'tpope/vim-eunuch' }

  -- support for .enditorconfig
  use { 'editorconfig/editorconfig-vim' }

  -- R support for nvim
  use { 'jalvesaq/Nvim-R', branch= 'stable'}

  -- Add,Delete and Change parentheses
  use { 'tpope/vim-surround'}
  use { 'tpope/vim-commentary'}

  -- A cool file explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    }
  }
  -- Show location in source tree in status line
  use {
    "SmiteshP/nvim-gps",
    requires = "nvim-treesitter/nvim-treesitter"
  }
  -- Some usefull snippets for a whole bunch of languages
  use { 'honza/vim-snippets' }

  -- Faster startup time
  use { 'lewis6991/impatient.nvim' }

  if PackerBootstrap then
    require('packer').sync()
  end
end,
config = {
  display = {
    open_fn = function ()
      return require('packer.util').float({ border = 'single' })
    end
  }
}})

local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
local PackerBootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  PackerBootstrap = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
end

return require("packer").startup {
  function(use)
    -- Make Packer manage itself
    use { "nvim-lua/plenary.nvim" }

    -- Lua Functions that you don't have to write yourself
    use { "wbthomason/packer.nvim" }

    --  -- Better/Faster FileType detection */
    --  use {
    --    "nathom/filetype.nvim",
    --    setup = function()
    --      require("plugins.filetype").setup()
    --    end,
    --  }
    -- Easy way to interface with tree-sitter, an incremental parsing system.
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require("plugins.treesitter").config()
      end,
    }

    use {
      "nvim-treesitter/nvim-treesitter-context",
      setup = function()
        require("plugins.treesitter-context").setup()
      end,
    }

    ---------------------------------------------------------------------------
    -- Visuals
    ---------------------------------------------------------------------------

    -- Fancy Icons
    use { "kyazdani42/nvim-web-devicons" }
    use { "lervag/vimtex" }
    -- The one and only true colorscheme: GRUVBOOOOOOX
    use {
      "ellisonleao/gruvbox.nvim",
      config = function()
        require "plugins.gruvbox"
      end,
    }

    -- Indentation tracking
    use { "lukas-reineke/indent-blankline.nvim" }

    -- A tab bar
    use {
      "romgrk/barbar.nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = function()
        require "plugins.barbar"
      end,
    }

    -- -- A statusline
    use {
      "nvim-lualine/lualine.nvim",
      requires = {
        "kyazdani42/nvim-web-devicons",
        "SmiteshP/nvim-gps",
      },
      config = function()
        require "plugins.lualine"
      end,
    }

    -- Sway i3 config highlighting
    use { "mboughaba/i3config.vim" }

    -- Cool startup Screen
    use {
      "goolord/alpha-nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = function()
        require("alpha").setup(require("alpha.themes.startify").config)
      end,
    }

    -- CMAKE syntax support
    use { "pboettch/vim-cmake-syntax" }

    -- run common Unix commands inside Vim
    -- use { "tpope/vim-eunuch" }
    ---------------------------------------------------------------------------
    -- Functionality
    ---------------------------------------------------------------------------

    -- Complete LSP package and more
    use {
      "neoclide/coc.nvim",
      branch = "release",
      setup = function()
        require("plugins.coc").setup()
      end,
      config = function()
        require("plugins.coc").config()
      end,
    }

    -- Find, Filter, Preview, Pick. All lua, all the time.
    use {
      "nvim-telescope/telescope.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require("plugins.telescope").setup()
      end,
      -- module = "telescope",
    }

    -- Documentation
    use {
      "danymat/neogen",
      requires = "nvim-treesitter",
      config = [[require('plugins.neogen')]],
      -- keys = { '<localleader>d', '<localleader>df', '<localleader>dc' },
    }

    -- move visual selection
    use { "Jorengarenar/vim-MvVis" }

    -- support for .enditorconfig
    use { "editorconfig/editorconfig-vim" }

    -----------------------------------------------------------------------------
    -- Stuff from the allmighty tpope
    -----------------------------------------------------------------------------
    -- Add,Delete and Change parentheses
    use { "tpope/vim-surround" }
    -- Comment and uncomment lines/visual blocks
    use { "tpope/vim-commentary" }
    -- Easily run Git commands from inside Vim
    use { "tpope/vim-fugitive" }
    use { "tpope/vim-dispatch" }

    -- A cool file explorer
    use {
      "kyazdani42/nvim-tree.lua",
      requires = {
        "kyazdani42/nvim-web-devicons", -- optional, for file icon
      },
      config = function()
        require("plugins.nvim-tree").setup()
      end,
    }
    -- Show location in source tree in status line
    use {
      "SmiteshP/nvim-gps",
      requires = "nvim-treesitter/nvim-treesitter",
      config = function()
        require("nvim-gps").setup()
      end,
    }

    -- Some usefull snippets for a whole bunch of languages
    use { "honza/vim-snippets" }

    -- Faster startup time
    use { "lewis6991/impatient.nvim" }

    -- Ansible Plugin
    use {
      "pearofducks/ansible-vim",
      requires = { "nvim-treesitter/nvim-treesitter", "neoclide/coc.nvim" },
      ft = { "yaml.ansible", "ansible" },
      config = function()
        require("plugins.ansible").setup()
      end,
    }

    -- better vim.ui interface with Telescope 🔭 support
    -- use {
    --   "stevearc/dressing.nvim",
    --   requires = { "nvim-telescope/telescope.nvim" },
    --   config = function()
    --     require("plugins.dressing").setup()
    --   end,
    -- }

    -- An undo history visualizer
    use {
      "mbbill/undotree",
      config = function()
        require("plugins.undotree").config()
      end,
    }

    -- Nice and fast vertical and horizontal movement
    use {
      "ggandor/lightspeed.nvim",
      config = function()
        require("plugins.lightspeed").config()
      end,
    }

    -- Fancy colors
    use {
      "norcalli/nvim-colorizer.lua",
      setup = function()
        require("colorizer").setup()
      end,
    }
    use { "Joakker/vim-antlr4" }

    if PackerBootstrap then
      require("packer").sync()
    end
  end,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float { border = "single" }
      end,
    },
  },
}

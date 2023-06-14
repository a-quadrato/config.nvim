return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require "plugins.gruvbox"
    end,
  },
  -- Make Packer manage itself
  { "nvim-lua/plenary.nvim" },

  -- Easy way to interface with tree-sitter, an incremental parsing system.
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("plugins.treesitter").config()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    setup = function()
      require("plugins.treesitter-context").setup()
    end,
  },

  ---------------------------------------------------------------------------
  -- Visuals
  ---------------------------------------------------------------------------

  -- Fancy Icons
  { "nvim-tree/nvim-web-devicons", lazy = false },
  { "lervag/vimtex", ft = { "tex" } },
  -- The one and only true colorscheme: GRUVBOOOOOOX
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require "plugins.gruvbox"
    end,
  },

  -- Indentation tracking
  { "lukas-reineke/indent-blankline.nvim" },

  -- A tab bar
  {
    "romgrk/barbar.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require "plugins.barbar"
    end,
  },

  -- -- A statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require "plugins.lualine"
    end,
  },

  -- Sway i3 config highlighting
  { "mboughaba/i3config.vim", ft = { "i3config" } },

  -- Cool startup Screen
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("alpha").setup(require("alpha.themes.startify").config)
    end,
  },

  -- CMAKE syntax support
  { "pboettch/vim-cmake-syntax" },

  ---------------------------------------------------------------------------
  -- Functionality
  ---------------------------------------------------------------------------

  -- Complete LSP package and more
  {
    "neoclide/coc.nvim",
    branch = "release",
    init = function()
      require("plugins.coc").setup()
    end,
    config = function()
      require("plugins.coc").config()
    end,
  },

  -- Find, Filter, Preview, Pick. All lua, all the time.
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.telescope").setup()
    end,
    -- module = "telescope",
  },

  -- Documentation
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter",
    config = [[require('plugins.neogen')]],
    -- keys = { '<localleader>d', '<localleader>df', '<localleader>dc' },
  },

  -- move visual selection
  { "Jorengarenar/vim-MvVis" },

  -- support for .enditorconfig
  { "editorconfig/editorconfig-vim" },

  -----------------------------------------------------------------------------
  -- Stuff from the allmighty tpope
  -----------------------------------------------------------------------------
  -- Add,Delete and Change parentheses
  { "tpope/vim-surround" },
  -- Comment and uncomment lines/visual blocks
  { "tpope/vim-commentary" },
  -- Easily run Git commands from inside Vim
  { "tpope/vim-fugitive" },
  { "tpope/vim-dispatch" },

  -- A cool file explorer
  {
    "kyazdani42/nvim-tree.lua",
    keys = { "<F5>" },
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icon
    },
    config = function()
      require("plugins.nvim-tree").setup()
    end,
  },
  { "neovim/nvim-lspconfig" },
  -- Show location in source tree in statuse {
  {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
    config = function()
      require("nvim-navic").setup()
    end,
  },

  -- Some usefull snippets for a whole bunch of languages
  { "honza/vim-snippets" },

  -- Ansible Plugin
  {
    "pearofducks/ansible-vim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "neoclide/coc.nvim" },
    ft = { "yaml.ansible", "ansible" },
    config = function()
      require("plugins.ansible").setup()
    end,
  },

  -- An undo history visualizer
  {
    "mbbill/undotree",
    config = function()
      require("plugins.undotree").config()
    end,
  },

  -- Nice and fast vertical and horizontal movement
  {
    "ggandor/lightspeed.nvim",
    config = function()
      require("plugins.lightspeed").config()
    end,
  },

  -- Fancy colors
  { "Joakker/vim-antlr4", ft = { "anltr", "anltr4" } },
}

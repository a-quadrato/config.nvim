local fn = vim.fn
print("plugin loaded")
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PackerBootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

return require("packer").startup({
	function(use)
		-- Make Packer manage itself
		use({ "nvim-lua/plenary.nvim" })

		-- Lua Functions that you don't have to write yourself
		use({ "wbthomason/packer.nvim" })

		-- Easy way to interface with tree-sitter, an incremental parsing system.
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = function()
				require("plugins.treesitter")
			end,
		})

		-- Better way to show register content
		use({
			"tversteeg/registers.nvim",
			keys = { { "n", '"' }, { "i", "<c-r>" } },
			config = function()
				require("plugins.registers").setup()
			end,
		})

		use({
			"lewis6991/gitsigns.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			-- tag = 'release' -- To use the latest release
			config = function()
				require("gitsigns").setup()
			end,
		})

		-- better QuickFix window for NeoVim
		use({ "kevinhwang91/nvim-bqf" })

		---------------------------------------------------------------------------
		-- Visuals
		---------------------------------------------------------------------------

		-- Fancy Icons
		use({ "kyazdani42/nvim-web-devicons" })
		-- The one and only true colorscheme: GRUVBOOOOOOX
		use({ "ellisonleao/gruvbox.nvim" })

		-- Indentation tracking
		use({ "lukas-reineke/indent-blankline.nvim" })

		-- A tab bar
		use({
			"romgrk/barbar.nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = function()
				require("plugins.barbar")
			end,
		})

		-- -- A statusline
		use({
			"nvim-lualine/lualine.nvim",
			requires = {
				"kyazdani42/nvim-web-devicons",
				"SmiteshP/nvim-gps",
			},
			config = function()
				require("plugins.lualine")
			end,
		})

		-- Sway i3 config highlighting
		use({ "mboughaba/i3config.vim" })

		-- Cool startup Screen
		use({
			"goolord/alpha-nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = function()
				require("alpha").setup(require("alpha.themes.startify").config)
			end,
		})

		-- CMAKE syntax support
		use({ "pboettch/vim-cmake-syntax" })

		---------------------------------------------------------------------------
		-- Functionality
		---------------------------------------------------------------------------

		-- Complete LSP package and more
		use({
			"neoclide/coc.nvim",
			branch = "release",
			config = function()
				require("plugins.coc").setup()
			end,
		})

		-- Find, Filter, Preview, Pick. All lua, all the time.
		use({
			"nvim-telescope/telescope.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			config = function()
				require("plugins.telescope").setup()
			end,
			-- module = "telescope",
		})

		-- Documentation
		use({
			"danymat/neogen",
			requires = "nvim-treesitter",
			config = [[require('plugins.neogen')]],
			-- keys = { '<localleader>d', '<localleader>df', '<localleader>dc' },
		})

		-- move visual selection
		use({ "Jorengarenar/vim-MvVis" })

		-- support for .enditorconfig
		use({ "editorconfig/editorconfig-vim" })

		-- R support for nvim
		use({ "jalvesaq/Nvim-R", branch = "stable" })

		-----------------------------------------------------------------------------
		-- Stuff from the allmighty tpope
		-----------------------------------------------------------------------------
		-- Add,Delete and Change parentheses
		use({ "tpope/vim-surround" })
		-- Comment and uncomment lines/visual blocks
		use({ "tpope/vim-commentary" })
		-- run common Unix commands inside Vim
		use({ "tpope/vim-eunuch" })
		-- Easily run Git commands from inside Vim
		use({ "tpope/vim-fugitive" })

		-- A cool file explorer
		use({
			"kyazdani42/nvim-tree.lua",
			requires = {
				"kyazdani42/nvim-web-devicons", -- optional, for file icon
			},
			config = function()
				require("plugins.nvim-tree").setup()
			end,
		})
		-- Show location in source tree in status line
		use({
			"SmiteshP/nvim-gps",
			requires = "nvim-treesitter/nvim-treesitter",
			config = function()
				require("nvim-gps").setup()
			end,
		})

		-- Some usefull snippets for a whole bunch of languages
		use({ "honza/vim-snippets" })

		-- Faster startup time
		use({ "lewis6991/impatient.nvim" })

		-- Ansible Plugin
		use({
			"pearofducks/ansible-vim",
			config = function()
				require("plugins.ansible").setup()
			end,
		})

		-- Browse keymaps, commands and autocmds with ease
		use({
			"mrjones2014/legendary.nvim",
			requires = { "stevearc/dressing.nvim" },
			config = function()
				require("plugins.legendary").config()
			end,
		})

		-- better vim.ui interface with Telescope 🔭 support
		use({
			"stevearc/dressing.nvim",
			requires = { "nvim-telescope/telescope.nvim" },
			config = function()
				require("plugins.dressing").setup()
			end,
		})

		if PackerBootstrap then
			require("packer").sync()
		end
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})

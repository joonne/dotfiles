vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	use({ "nvim-telescope/telescope.nvim", tag = "0.1.4", requires = { { "nvim-lua/plenary.nvim" } } })

	use({
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	})

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("mbbill/undotree")
	use("github/copilot.vim")
	use("airblade/vim-gitgutter")
	use({
		"akinsho/bufferline.nvim",
		tag = "*",
		requires = "nvim-tree/nvim-web-devicons",
	})
	use("mfussenegger/nvim-dap")
	use("kylechui/nvim-surround")
	use("m4xshen/autoclose.nvim")
	use("terrortylor/nvim-comment")
	use("stevearc/vim-arduino")
	use("joeveiga/ng.nvim")
	use("lewis6991/gitsigns.nvim")
	use({
		"olimorris/codecompanion.nvim",
		config = function()
			require("codecompanion").setup()
		end,
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	})
	use({
		"ravitemer/mcphub.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		build = "npm install -g mcp-hub@latest",
		config = function()
			require("mcphub").setup()
		end,
	})
	use("stevearc/conform.nvim")
end)

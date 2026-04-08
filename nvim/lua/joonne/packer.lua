local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
    gh("hrsh7th/nvim-cmp"),
	gh("hrsh7th/cmp-nvim-lsp"),
	gh("L3MON4D3/LuaSnip"),
	gh("neovim/nvim-lspconfig"),
	gh("williamboman/mason.nvim"),
	gh("williamboman/mason-lspconfig.nvim"),
	gh("nvim-lua/plenary.nvim"),
    {
		src = gh("nvim-telescope/telescope.nvim"),
		version = "*",
		requires = { { "nvim-lua/plenary.nvim" } },
	},
    {
		src = gh("rose-pine/neovim"),
		name = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	},
	gh("nvim-treesitter/nvim-treesitter"),
	gh("mbbill/undotree"),
	gh("github/copilot.vim"),
	gh("airblade/vim-gitgutter"),
	{
		src = gh("akinsho/bufferline.nvim"),
		version = "*",
		requires = "nvim-tree/nvim-web-devicons",
	},
	gh("mfussenegger/nvim-dap"),
	gh("kylechui/nvim-surround"),
	gh("m4xshen/autoclose.nvim"),
	gh("terrortylor/nvim-comment"),
	gh("stevearc/vim-arduino"),
	gh("joeveiga/ng.nvim"),
	gh("lewis6991/gitsigns.nvim"),
	{
		src = gh("ThePrimeagen/harpoon"),
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } },
	},
	{
		src = gh("ravitemer/mcphub.nvim"),
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		build = "npm install -g mcp-hub@latest",
	},
	{
		src = gh("olimorris/codecompanion.nvim"),
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"ravitemer/mcphub.nvim",
		},
	},
	gh("stevearc/conform.nvim")
})

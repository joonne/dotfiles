local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
    gh("hrsh7th/nvim-cmp"),
	gh("hrsh7th/cmp-nvim-lsp"),
	gh("L3MON4D3/LuaSnip"),
	gh("neovim/nvim-lspconfig"),
	gh("williamboman/mason.nvim"),
	gh("williamboman/mason-lspconfig.nvim"),
	gh("nvim-lua/plenary.nvim"),
    gh("nvim-telescope/telescope.nvim"),
    gh("rose-pine/neovim"),
	gh("nvim-treesitter/nvim-treesitter"),
	gh("mbbill/undotree"),
	gh("github/copilot.vim"),
	gh("airblade/vim-gitgutter"),
    gh("nvim-tree/nvim-web-devicons"),
    gh("akinsho/bufferline.nvim"),
	gh("mfussenegger/nvim-dap"),
	gh("kylechui/nvim-surround"),
	gh("m4xshen/autoclose.nvim"),
	gh("terrortylor/nvim-comment"),
	gh("stevearc/vim-arduino"),
	gh("joeveiga/ng.nvim"),
	gh("lewis6991/gitsigns.nvim"),
	{
		src = gh("ThePrimeagen/harpoon"),
		branch = "harpoon2"
	},
    gh("ravitemer/mcphub.nvim"),
	gh("olimorris/codecompanion.nvim"),
	gh("stevearc/conform.nvim")
})

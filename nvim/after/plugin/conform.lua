require("conform").setup({
	formatters_by_ft = {
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		typescriptreact = { "prettierd" },
		json = { "prettierd" },
		css = { "prettierd" },
		scss = { "prettierd" },
		html = { "prettierd" },
		lua = { "stylua" },
		sh = { "shfmt" },
		fish = { "fish_lsp" },
		markdown = { "prettierd" },
		java = { "google_java_format" },
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
	format_on_save = {
		timeout_ms = 500,
	},
	notify_on_error = true,
	notify_no_formatters = true,
})

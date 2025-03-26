local format_on_save = require("format-on-save")
local formatters = require("format-on-save.formatters")

-- npm install -g eslint_d @fsouza/prettierd

format_on_save.setup({
  experiments = {
    partial_update = 'diff', -- or 'line-by-line'
  },
  exclude_path_patterns = {
    "/node_modules/",
  },
  formatter_by_ft = {
    css = formatters.lsp,
    html = formatters.lsp,
    javascript = formatters.lsp,
    lua = formatters.lsp,
    markdown = formatters.prettierd,
    scss = formatters.lsp,
    sh = formatters.shfmt,
    terraform = formatters.lsp,
    typescript = formatters.prettierd,
    typescriptreact = formatters.prettierd,
    yaml = formatters.lsp,
    toml = formatters.lsp,
    dart = formatters.lsp,
    cpp = formatters.lsp,
    h = formatters.lsp,
    kt = formatters.lsp,

    javascript = {
      formatters.if_file_exists({
        pattern = ".eslintrc.*",
        formatter = formatters.eslint_d_fix
      }),
      formatters.if_file_exists({
        pattern = { ".prettierrc", ".prettierrc.*", "prettier.config.*" },
        formatter = formatters.prettierd,
      }),
    },
    typescript = {
      formatters.if_file_exists({
        pattern = ".eslintrc.*",
        formatter = formatters.eslint_d_fix
      }),
      formatters.if_file_exists({
        pattern = { ".prettierrc", ".prettierrc.*", "prettier.config.*" },
        formatter = formatters.prettierd,
      }),
    },
    json = {
      formatters.if_file_exists({
        pattern = { ".prettierrc", ".prettierrc.*", "prettier.config.*" },
        formatter = formatters.prettierd,
      }),
    },
  },

  fallback_formatter = {
    formatters.remove_trailing_whitespace,
    formatters.remove_trailing_newlines,
    -- formatters.prettierd,
  },

  -- By default, all shell commands are prefixed with "sh -c" (see PR #3)
  -- To prevent that set `run_with_sh` to `false`.
  run_with_sh = false,
})

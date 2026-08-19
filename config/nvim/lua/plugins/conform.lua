local prettier = { "prettierd", "prettier", stop_after_first = true }

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    rust = { "rustfmt", lsp_format = "fallback" },
    python = { "isort", "black" },
    javascript = prettier,
    javascriptreact = prettier,
    typescript = prettier,
    typescriptreact = prettier,
    json = prettier,
    jsonc = prettier,
    yaml = prettier,
    css = prettier,
    scss = prettier,
    html = prettier,
    markdown = prettier,
  },
  format_on_save = {
    timeout_ms = 2000,
    lsp_format = "fallback",
  },
})

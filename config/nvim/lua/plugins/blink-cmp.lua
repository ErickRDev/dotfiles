require("blink.cmp").setup({
  keymap = {
    preset = "default",
    ["<C-e>"] = { "select_and_accept", "fallback" },
    ["<C-y>"] = { "cancel", "fallback" },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" }
  },
})

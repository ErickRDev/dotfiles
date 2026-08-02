require("settings")
require("pack")
require("lsp")
require("binds")
require("plugins")

require("cendre").setup({
  background = "hard", -- "hard" | "medium" | "soft"
  italic = false,
})

vim.cmd([[colorscheme cendre]])
-- vim.cmd([[colorscheme moonfly]])

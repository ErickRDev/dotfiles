local telescope = require("telescope.builtin")
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = ","

-- buffers
map("n", "<leader>wh", ":split<CR>", { silent = true })
map("n", "<leader>wv", ":vsplit<CR>", { silent = true })
map("n", "<space><tab>", ":e#<CR>")
map("n", "<leader>s", ":w<CR>", { silent = true })
map("n", "<leader>x", ":x<CR>", { silent = true })
map("n", "<leader>f", ":NvimTreeFindFile<CR>")
map("n", "<C-n>", ":NvimTreeToggle<CR>")
map("n", "<C-p>", telescope.find_files)
map("n", "<C-b>", telescope.buffers)
map("n", "<C-s>", telescope.live_grep)
map("n", "<leader>gs", telescope.grep_string)

-- LSP Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
map("n", "<space>e", vim.diagnostic.open_float, opts)
map("n", "[d", vim.diagnostic.goto_prev, opts)
map("n", "]d", vim.diagnostic.goto_next, opts)
map("n", "<space>q", vim.diagnostic.setloclist, opts)

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings
    local bufopts = { noremap = true, silent = true, buffer = ev.buf }
    map("n", "ga", telescope.lsp_references, bufopts)
    map("n", "gI", vim.lsp.buf.implementation, bufopts)
    map("n", "gy", vim.lsp.buf.type_definition, bufopts)
    map("n", "gD", vim.lsp.buf.declaration, bufopts)
    map("n", "gd", vim.lsp.buf.definition, bufopts)
    map("n", "<space>rn", vim.lsp.buf.rename, bufopts)
    map("n", "K", vim.lsp.buf.hover, bufopts)
  end,
})

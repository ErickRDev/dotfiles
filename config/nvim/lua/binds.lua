local telescope = require("telescope.builtin")
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)

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
map("n", "<C-x>", ":tabclose<CR>")
map("n", "<leader>gs", telescope.grep_string)

-- git
map("n", "<C-g>", ":DiffviewOpen<CR>")

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

-- registers
map("v", "<C-y>", '"+y') -- copy to system clipboard

-- Copy file path / selection reference for pasting into AI chats
local function copy_ref(opts)
  -- "%" is the current buffer's file name; ":." makes it relative to the cwd
  local path = vim.fn.expand("%:.")
  -- ref is what ends up in the clipboard; start with just the path
  local ref = path

  if opts.visual then
    -- '< and '> are only set after leaving visual mode, so read the live selection:
    -- "v" is the line where visual mode was started (the anchor)
    local start_line = vim.fn.line("v")
    -- "." is the line the cursor is on now (the moving end of the selection)
    local end_line = vim.fn.line(".")
    -- if the selection was made upward, swap so start is always the smaller line
    if start_line > end_line then
      start_line, end_line = end_line, start_line
    end
    -- append the range, e.g. "lua/config/keymaps.lua:1:23"
    ref = path .. ":" .. start_line .. ":" .. end_line
  end

  -- ask for an optional free-text note on the command line (Enter to skip)
  local note = vim.fn.input("Prompt (optional): ")
  if note ~= "" then
    -- append the note after the ref, separated by a space
    ref = ref .. " " .. note
  end

  -- write ref into the "+" register, which is the system clipboard
  vim.fn.setreg("+", ref)
  -- show a confirmation message with what was copied
  vim.notify("Copied: " .. ref)
end

-- normal mode: copy just the file path
map("n", "<leader>cp", function()
  copy_ref({})
end, { desc = "Copy file path" })

-- visual mode: copy the file path plus the selected line range
map("v", "<leader>cp", function()
  copy_ref({ visual = true })
  -- leave visual mode after copying the selection
  vim.api.nvim_feedkeys(esc, "n", false)
end, { desc = "Copy file path with line range" })

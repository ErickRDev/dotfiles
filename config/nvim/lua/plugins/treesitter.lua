local parsers = {
  "rust",
  "lua",
  "json",
  "javascript",
  "python",
  "typescript",
  "go",
  "markdown",
  "markdown_inline",
  "html",
  "latex",
  "yaml"
}

local treesitter = require("nvim-treesitter")
treesitter.setup { install_dir = vim.fn.stdpath("data") .. "/site" }
treesitter.install(parsers)

vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    local buf = args.buf
    local filetype = args.match

    local language = vim.treesitter.language.get_lang(filetype) or filetype
    if not vim.treesitter.language.add(language) then
      return
    end

    vim.treesitter.start(buf, language)

    -- replicate `fold = { enable = true }`
    -- vim.wo.foldmethod = "expr"
    -- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    -- replicate `indent = { enable = true }`
    -- vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

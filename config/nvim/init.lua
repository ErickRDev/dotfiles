require('load-vim')
require('lsp')
require('options')

require'nvim-tree'.setup {}
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "json", "javascript", "python", "rust", "typescript", "go" },
    auto_install = true,
    highlight = {
        enable = true
    }
}

local telescope = require('telescope')
telescope.setup()
telescope.load_extension('fzf')

require'lualine'.setup {
    options = { theme = 'moonfly' }
}

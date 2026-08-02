local gh = function(x) return "https://github.com/" .. x end
local pack_install_or_update = function(kind) return kind == "install" or kind == "update" end

local hooks = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind

  if name == "telescope-fzf-native.nvim" and pack_install_or_update(kind) then
    local obj = vim.system({ "make" }, { cwd = ev.data.path }):wait()
    if obj.code ~= 0 then
      vim.notify(
        ("telescope-fzf-native.nvim build failed (exit %d):\n%s"):format(obj.code, obj.stderr or ""),
        vim.log.levels.ERROR
      )
    end
  end
end

vim.api.nvim_create_autocmd("PackChanged", { callback = hooks })

vim.pack.add({
  -- ui
  gh("nvim-lualine/lualine.nvim"),
  gh("nvim-tree/nvim-tree.lua"),
  -- git
  gh("sindrets/diffview.nvim"),
  -- lsp
  gh("neovim/nvim-lspconfig"),
  -- syntax highlighting
  gh("nvim-treesitter/nvim-treesitter"),
  -- formatting
  gh("stevearc/conform.nvim"),
  -- navigation
  gh("christoomey/vim-tmux-navigator"),
  gh("nvim-lua/plenary.nvim"),
  gh("nvim-telescope/telescope.nvim"),
  gh("nvim-telescope/telescope-fzf-native.nvim"),
  -- style
  gh("nvim-tree/nvim-web-devicons"),
  gh("Aejkatappaja/cendre"),
  { src = gh("bluz71/vim-moonfly-colors"), name = "moonfly" },
  -- completion
  {
    src = gh("saghen/blink.cmp"),
    version = vim.version.range("^1"),
  },
})

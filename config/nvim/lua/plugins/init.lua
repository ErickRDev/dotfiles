local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"

for name, kind in vim.fs.dir(plugin_dir) do
  if kind == "file" and name ~= "init.lua" then
    require("plugins." .. name:gsub("%.lua$", ""))
  end
end

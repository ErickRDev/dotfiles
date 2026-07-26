local global_ts_lib

local function get_global_ts_lib()
  if global_ts_lib == nil then
    local npm_root = vim.fn.systemlist("npm root -g")[1]
    global_ts_lib = npm_root and vim.fs.joinpath(npm_root, "typescript", "lib") or false
  end
  return global_ts_lib or nil
end

local function find_local_ts_lib(root_dir)
  local dir = root_dir
  while dir do
    local candidate = vim.fs.joinpath(dir, "node_modules", "typescript", "lib")
    if vim.uv.fs_stat(candidate) then
      return candidate
    end
    local parent = vim.fs.dirname(dir)
    if parent == dir then
      break
    end
    dir = parent
  end
  return nil
end

return {
  before_init = function(params, config)
    local ts_lib = find_local_ts_lib(config.root_dir) or get_global_ts_lib()
    if ts_lib then
      config.init_options = config.init_options or {}
      config.init_options.tsserver = config.init_options.tsserver or {}
      config.init_options.tsserver.path = ts_lib
      params.initializationOptions = config.init_options
    end
  end,
}

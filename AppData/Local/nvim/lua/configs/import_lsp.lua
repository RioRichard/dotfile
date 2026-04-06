local data = vim.fn.stdpath "config" .. "/lua/plugins/"
local lsp_paths = {}
function get_lsp_path(dir, plugins_dir, path_list)
  local current_dir = vim.fn.readdir(dir)
  for _, value in ipairs(current_dir) do
    if value == "lspconfig.lua" then
      local lsp_path = plugins_dir .. "." .. "lspconfig"
      table.insert(path_list, lsp_path)
    end
    local next_dir = dir .. value
    local next_require = plugins_dir .. "." .. value
    local is_directory = vim.fn.isdirectory(next_dir)
    if is_directory == 1 then
      get_lsp_path(next_dir, next_require, path_list)
    end
  end
end

get_lsp_path(data, "plugins", lsp_paths)

for _, value in ipairs(lsp_paths) do
  require(value)
end

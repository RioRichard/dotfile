require "configs.import_lsp"
require("nvchad.configs.lspconfig").defaults()
-- local servers = { "html", "cssls" }
local servers = {
  html = {},
  cssls = {},
  ruff = {},
  tsserver = {
    cmd = { "typescript-language-server", "--stdio" },
    filetype = { "typescript", "javascript" },
  },
  pyright = {
    settings = {
      python = {
        pythonPath = vim.fn.exepath "python3",
      },
    },
  },
  ["rust-analyzer"] = {},
}

-- powershell
local powershell_es_bundle_path = nil
local osname = vim.loop.os_uname().sysname
if osname == "Linux" then
  powershell_es_bundle_path = "~/Downloads/PowerShellES/"
else
  powershell_es_bundle_path = "C:/Program Files/PowerShellEditorServices/"
end
local powershell_module = "powershell_es"
local powershell_config = {
  root_markers = { ".ps1", ".psm", ".psd1" },
  bundle_path = powershell_es_bundle_path,
}

servers[powershell_module] = powershell_config

for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end

require "nvchad.options"

-- add yours here!

local g = vim.g
local o = vim.o
local opt = vim.opt

-- o.cursorlineopt = "both" -- to enable cursorline!
o.swapfile = false

g.autoformat = true
opt.undofile = true
opt.undolevels = 10000
opt.spelllang = { "en", "vi", "zh" }
opt.smoothscroll = true

if os.getenv "WSL_INTEROP" or os.getenv "WSL_DISTRO_NAME" then
  local function no_paste(reg)
    return function(lines) end
  end
  g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy "+",
      ["*"] = require("vim.ui.clipboard.osc52").copy "*",
    },
    paste = {
      ["+"] = no_paste "+",
      ["*"] = no_paste "*",
    },
  }
end

-- Enable visual line wrapping
opt.wrap = true
-- Break lines at the end of words instead of in the middle of them
opt.linebreak = true
-- Disable the display of whitespace characters, which can look messy with wrapping
opt.list = false
-- Preserve indentation on wrapped lines
opt.breakindent = true

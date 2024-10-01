--[[
  __               __ __              
 |  |.--.--.---.-.|  |__|.-----.-----.
 |  ||  |  |  _  ||  |  ||     |  -__|
 |__||_____|___._||__|__||__|__|_____|

A blazing fast and easy to configure Neovim statusline written in Lua.

See :help lualine.txt
https://github.com/nvim-lualine/lualine.nvim

--]]
local components = require("lvim.core.lualine.components")

lvim.builtin.lualine.sections = {
  lualine_a = {
    components.mode,
  },
  lualine_b = {
    components.branch,
    { "filename", path = 1 },
  },
  lualine_c = {
    components.diff,
  },
}

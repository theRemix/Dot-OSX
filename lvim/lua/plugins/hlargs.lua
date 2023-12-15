--[[
. __     __                         
 |  |--.|  |.---.-.----.-----.-----.
 |     ||  ||  _  |   _|  _  |__ --|
 |__|__||__||___._|__| |___  |_____|
.                      |_____|      

Highlight arguments' definitions and usages, using Treesitter

See :help hlargs

--]]

local ok, hlargs = pcall(require, "hlargs")
if ok then
  hlargs.setup({
    color = "#dd636e",
    highlight = {},
    excluded_filetypes = {},
    paint_arg_declarations = true,
    paint_arg_usages = true,
    paint_catch_blocks = {
      declarations = false,
      usages = false,
    },
    extras = {
      named_parameters = true,
    },
    hl_priority = 10000,
  })
end

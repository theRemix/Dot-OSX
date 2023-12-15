--[[
. __           __               __   __ __                    
 |__|.-----.--|  |.-----.-----.|  |_|  |__|.-----.-----.-----.
 |  ||     |  _  ||  -__|     ||   _|  |  ||     |  -__|__ --|
 |__||__|__|_____||_____|__|__||____|__|__||__|__|_____|_____|
.                                                             

renders vertical lines for indent levels

see $LUNARVIM_BASE_DIR/lua/lvim/core/indentlines.lua

docs https://github.com/lukas-reineke/indent-blankline.nvim

--]]

local indentlines = lvim.builtin.indentlines

indentlines.active = true

indentlines.options = {
  enabled = true,
  show_current_context = true,
  show_current_context_start = true,
  show_first_indent_level = false,
  space_char_blankline = " ",
  use_treesitter = true,
  use_treesitter_scope = true,

  -- fix tab spacing in ts files
}

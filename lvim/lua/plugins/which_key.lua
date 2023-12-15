--[[
 .          __         __                  __                       ___ __
 .--------.|__|.-----.|__|.--------.---.-.|  |   .----.-----.-----.'  _|__|.-----.
 |        ||  ||     ||  ||        |  _  ||  |   |  __|  _  |     |   _|  ||  _  |
 |__|__|__||__||__|__||__||__|__|__|___._||__|   |____|_____|__|__|__| |__||___  |
 .                                                                         |_____|


After making any change, run
:source ~/.config/lvim/config.lua # or path to where this file is
:LvimReload

TODO

- qq to close all and quit
- q to close current buffer

--]]
local which_key = lvim.builtin.which_key

-----------------------------------------------------------
-- Options
-----------------------------------------------------------
which_key.setup.plugins.marks = true     -- shows a list of your marks on ' and `
which_key.setup.plugins.registers = true -- shows your registers on " in NORMAL or <C-r> in INSERT mode
-- disable so we can use telescope
-- which_key.setup.plugins.spelling.enabled = false

-----------------------------------------------------------
-- Which Key Globals
-----------------------------------------------------------
which_key.language_prefix = "m" -- shared keymapping for ../languages/*

-----------------------------------------------------------
-- Key Mappings
-----------------------------------------------------------
which_key.mappings[";"] = { "<cmd>copen<cr>", "Open Quickfix  " }
which_key.mappings["w"] = { "<cmd>w!<cr>", "Save  " }

-- initial parent for mappings in ../languages/*
which_key.mappings[which_key.language_prefix] = {
  name = "Languages  "
}

-- Easymotion is mapping h j k and l
-- remap the original defaults to something else
-- original "h" : no highlight
which_key.mappings["H"] = { "<cmd>nohlsearch<CR>", "No Highlight" }

-- move "L" : +LunarVim to "v"
which_key.mappings["v"] = which_key.mappings["L"]
-- make pretty
which_key.mappings["v"].name = "LunarVim  "

-- original "l" : +LSP
which_key.mappings["L"] = which_key.mappings["l"]
-- make pretty
which_key.mappings["L"].name = "LSP  "

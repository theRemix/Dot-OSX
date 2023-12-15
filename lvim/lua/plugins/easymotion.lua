--[[
.                          _   _
 ___ ___ ___ _ _ _____ ___| |_|_|___ ___
| -_| .'|_ -| | |     | . |  _| | . |   |
|___|__,|___|_  |_|_|_|___|_| |_|___|_|_|
.           |___|

Navigate around your buffer quickly.
Quick Commands

<s>  then type the first letter in some location,
     then type the highlighted letter to jump
<ss> then type the first two letters in some location,
     then type the highlighted letter to jump

<leader> j/k then type the highlighted letter to jump vertically
<leader> h/l then type the highlighted letter to jump horizontally

</> start searching. press enter to complete search.
    then type the highlighted letter to jump

See :help easymotion

--]]


-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------
table.insert(lvim.plugins, { "easymotion/vim-easymotion" }) -- move cursor easily using first letter search and hjkl jumps

-----------------------------------------------------------
-- Options
-----------------------------------------------------------
-- Turn on case-insensitive feature
vim.g.EasyMotion_smartcase = 1
-- keep cursor column when JK motion
vim.g.EasyMotion_startofline = 0
--
vim.diagnostic.config({ virtual_text = false })

-----------------------------------------------------------
-- Key Mappings
-----------------------------------------------------------
local normal_mode = lvim.keys.normal_mode
lvim.keys.o = (lvim.keys.o == nil and {}) or lvim.keys.o
local operator_mode = lvim.keys.o
local which_key = lvim.builtin.which_key

normal_mode["s"] = "<Plug>(easymotion-overwin-f)"
normal_mode["ss"] = "<Plug>(easymotion-overwin-f2)"
normal_mode["/"] = "<Plug>(easymotion-sn)"
operator_mode["/"] = "<Plug>(easymotion-tn)"

-- maps <leader>(direction) keys
-- LunarVim default "h" for no highlight needs to be remapped
-- LunarVim default "l" for +LSP needs to be remapped
which_key.mappings["h"] = { "<Plug>(easymotion-linebackward)", "which_key_ignore" } -- EasyMotion ←
which_key.mappings["j"] = { "<Plug>(easymotion-j)", "which_key_ignore" }            -- EasyMotion ↑
which_key.mappings["k"] = { "<Plug>(easymotion-k)", "which_key_ignore" }            -- EasyMotion ↓
which_key.mappings["l"] = { "<Plug>(easymotion-lineforward)", "which_key_ignore" }  -- EasyMotion →

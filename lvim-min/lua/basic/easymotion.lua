--[[
.        __         __          
 .---.-.|  |.-----.|  |--.---.-.
 |  _  ||  ||  _  ||     |  _  |
 |___._||__||   __||__|__|___._|
.           |__|                

Renders the dashboard you see when launching lvim with no file argument

See :help easymotion

--]]

local normal_mode = lvim.keys.normal_mode
lvim.keys.o = (lvim.keys.o == nil and {}) or lvim.keys.o 
local operator_mode = lvim.keys.o
local which_key = lvim.builtin.which_key
local autocmd = vim.api.nvim_create_autocmd

-- Prevent messing up diagnostics after easymotion-j/k
-- Does not start back up nicely, consider vim-sneak as alternative
-- autocmd("User", {
-- 	pattern = "EasyMotionPromptBegin",
-- 	command = "silent! LspStop",
-- })
-- autocmd("User", {
-- 	pattern = "EasyMotionPromptEnd",
-- 	command = "silent! LspStart",
-- })

-- Turn on case-insensitive feature
vim.g.EasyMotion_smartcase = 1
-- keep cursor column when JK motion
vim.g.EasyMotion_startofline = 0 

normal_mode["s"] = "<Plug>(easymotion-overwin-f)"
normal_mode["ss"] = "<Plug>(easymotion-overwin-f2)"
normal_mode["/"] = "<Plug>(easymotion-sn)"
operator_mode["/"] = "<Plug>(easymotion-tn)"

which_key.mappings["h"] = { "<Plug>(easymotion-linebackward)", "EasyMotion Line Backward" }
which_key.mappings["j"] = { "<Plug>(easymotion-j)", "EasyMotion Line Up" }
which_key.mappings["k"] = { "<Plug>(easymotion-k)", "EasyMotion Line Down" }
which_key.mappings["l"] = { "<Plug>(easymotion-lineforward)", "EasyMotion Line Forward" }

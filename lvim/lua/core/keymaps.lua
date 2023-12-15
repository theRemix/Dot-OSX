local normal_mode = lvim.keys.normal_mode
local insert_mode = vim.api.nvim_set_keymap
local visual_mode = lvim.keys.visual_mode

-- Map "jk" -> ESC
insert_mode("i", "jk", "<Esc>", { noremap = true, silent = true })

-- cycle through buffers
normal_mode["<Tab>"] = "<cmd>BufferLineCycleNext<cr>"
normal_mode["<S-Tab>"] = "<cmd>BufferLineCyclePrev<cr>"

-- move lines up and down (mac) Alt+j/k
normal_mode["∆"] = "mz:m+<cr>`z"
normal_mode["˚"] = "mz:m-2<cr>`z"
visual_mode["˚"] = ":m'<-2<cr>`>my`<mzgv`yo`z"
visual_mode["∆"] = ":m'>+<cr>`<my`>mzgv`yo`z"

-- Smarter yank
--   yanks line starting from cursor
--   good for yanking to cli
visual_mode["Y"] = "y$"

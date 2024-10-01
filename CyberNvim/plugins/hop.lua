-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------

local status_ok, hop = pcall(require, "hop")
if not status_ok then
  vim.api.nvim_err_writeln("hop failed to load!")
  return
end

-----------------------------------------------------------
-- Key Mappings
-----------------------------------------------------------

local map = vim.api.nvim_set_keymap

-- Quick Hop anywhere with 's'
map("n", "s", "<cmd>:HopChar1<CR>", { noremap = true, silent = true })

-- Hop in visual mode
map("v", "<leader>h", "<cmd>HopWordBC<CR>", { noremap = true, silent = true })
map("v", "<leader>j", "<cmd>HopVerticalAC<CR>", { noremap = true, silent = true })
map("v", "<leader>k", "<cmd>HopVerticalBC<CR>", { noremap = true, silent = true })
map("v", "<leader>l", "<cmd>HopWordAC<CR>", { noremap = true, silent = true })

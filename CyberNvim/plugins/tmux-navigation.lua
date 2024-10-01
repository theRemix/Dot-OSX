-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------
local status_ok, nvim_tmux_nav = pcall(require, "nvim-tmux-navigation")
if not status_ok then
  vim.api.nvim_err_writeln("nvim-tmux-navigation failed to load!")
  return
end

nvim_tmux_nav.setup {}

-----------------------------------------------------------
-- Key Mappings
-----------------------------------------------------------
vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)

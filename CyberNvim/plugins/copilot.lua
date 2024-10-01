--[[
.            _ _     _
 ___ ___ ___|_| |___| |_
|  _| . | . | | | . |  _|
|___|___|  _|_|_|___|_|
.       |_|

README to setup and configure before use
https://docs.github.com/en/copilot/using-github-copilot/getting-started-with-github-copilot?tool=vimneovim#about-github-copilot-and-vimneovim

See :Copilot help

--]]


-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------
local status_ok, copilot = pcall(require, "copilot.vim")
if not status_ok then
  vim.api.nvim_err_writeln("copilot failed to load!")
  return
end

copilot.setup()

-----------------------------------------------------------
-- Key Mapping
-----------------------------------------------------------
local map = vim.api.nvim_set_keymap

-- If there are no suggestions, default to actually typing a \t character
-- map("i", "<Tab>", 'copilot#Accept("<Tab>")', { silent = true, expr = true })
-- vim.g.copilot_no_tab_map = true    -- required for remapping
-- vim.g.copilot_assume_mapped = true -- required for the plugin to work at all no nvim

-- which_key.mappings["a"] = {
--   name = "GitHub Copilot  ",
--   p = {
--     "<cmd>Copilot panel<cr>", "Copilot Panel"
--   },
--   s = {
--     "<cmd>call copilot#Suggest()<cr>",
--     "Suggest"
--   },
--   d = {
--     "<cmd>Copilot disable<cr>",
--     "Disable"
--   },
--   e = {
--     "<cmd>Copilot enable<cr>",
--     "Enable"
--   },
-- }

-----------------------------------------------------------
-- File Type Exclusion
-----------------------------------------------------------

vim.g.copilot_filetypes = {
  ["*"] = false, -- Disable for all other files
  ["javascript"] = true,
  ["typescript"] = true,
  ["lua"] = false,
  ["rust"] = true,
  ["c"] = true,
  ["c#"] = true,
  ["c++"] = true,
  ["go"] = true,
  ["python"] = true,
}


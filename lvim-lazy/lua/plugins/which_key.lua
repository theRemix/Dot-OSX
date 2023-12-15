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
-- Key Mappings
-----------------------------------------------------------
which_key.mappings[";"] = { "<cmd>copen<cr>", "Open Quickfix  " }
which_key.mappings["w"] = { "<cmd>w!<cr>", "Save  " }

-- Easymotion is mapping h j k and l
-- remap the original defaults to something else
-- original "h" : no highlight
which_key.mappings["H"] = { "<cmd>nohlsearch<CR>", "No Highlight" }
-- move "L" : +LunarVim to "v"
which_key.mappings["v"] = {
  name = "LunarVim  ",
  c = {
    "<cmd>edit " .. get_config_dir() .. "/config.lua<cr>",
    "Edit config.lua",
  },
  d = { "<cmd>LvimDocs<cr>", "View LunarVim's docs" },
  f = {
    "<cmd>lua require('lvim.core.telescope.custom-finders').find_lunarvim_files()<cr>",
    "Find LunarVim files",
  },
  g = {
    "<cmd>lua require('lvim.core.telescope.custom-finders').grep_lunarvim_files()<cr>",
    "Grep LunarVim files",
  },
  k = { "<cmd>Telescope keymaps<cr>", "View LunarVim's keymappings" },
  i = {
    "<cmd>lua require('lvim.core.info').toggle_popup(vim.bo.filetype)<cr>",
    "Toggle LunarVim Info",
  },
  I = {
    "<cmd>lua require('lvim.core.telescope.custom-finders').view_lunarvim_changelog()<cr>",
    "View LunarVim's changelog",
  },
  l = {
    name = "+logs",
    d = {
      "<cmd>lua require('lvim.core.terminal').toggle_log_view(require('lvim.core.log').get_path())<cr>",
      "view default log",
    },
    D = {
      "<cmd>lua vim.fn.execute('edit ' .. require('lvim.core.log').get_path())<cr>",
      "Open the default logfile",
    },
    l = {
      "<cmd>lua require('lvim.core.terminal').toggle_log_view(vim.lsp.get_log_path())<cr>",
      "view lsp log",
    },
    L = { "<cmd>lua vim.fn.execute('edit ' .. vim.lsp.get_log_path())<cr>", "Open the LSP logfile" },
    n = {
      "<cmd>lua require('lvim.core.terminal').toggle_log_view(os.getenv('NVIM_LOG_FILE'))<cr>",
      "view neovim log",
    },
    N = { "<cmd>edit $NVIM_LOG_FILE<cr>", "Open the Neovim logfile" },
  },
  r = { "<cmd>LvimReload<cr>", "Reload LunarVim's configuration" },
  u = { "<cmd>LvimUpdate<cr>", "Update LunarVim" },
}
-- original "l" : +LSP
which_key.mappings["L"] = {
  name = "LSP  ",
  a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
  d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
  w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
  f = { "<cmd>lua require('lvim.lsp.utils').format()<cr>", "Format" },
  i = { "<cmd>LspInfo<cr>", "Info" },
  I = { "<cmd>Mason<cr>", "Mason Info" },
  j = {
    "<cmd>lua vim.diagnostic.goto_next()<cr>",
    "Next Diagnostic",
  },
  k = {
    "<cmd>lua vim.diagnostic.goto_prev()<cr>",
    "Prev Diagnostic",
  },
  l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
  q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
  r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
  s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
  S = {
    "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
    "Workspace Symbols",
  },
  e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
}

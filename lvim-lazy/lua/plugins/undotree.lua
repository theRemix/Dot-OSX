--[[
.          _     _
 _ _ ___ _| |___| |_ ___ ___ ___
| | |   | . | . |  _|  _| -_| -_|
|___|_|_|___|___|_| |_| |___|___|

neovim undotree with git diff

See :help undotree

--]]

-----------------------------------------------------------
-- Config
-----------------------------------------------------------
local config = {
  float_diff = true,      -- using float window previews diff, set this `true` will disable layout option
  layout = "left_bottom", -- "left_bottom", "left_left_bottom"
  position = "left",      -- "right", "bottom"
  ignore_filetype = { 'undotree', 'undotreeDiff', 'qf', 'TelescopePrompt', 'spectre_panel', 'tsplayground' },
  window = {
    winblend = 30,
  },
  keymaps = {
    ['j'] = "move_next",
    ['k'] = "move_prev",
    ['gj'] = "move2parent",
    ['J'] = "move_change_next",
    ['K'] = "move_change_prev",
    ['<cr>'] = "action_enter",
    ['p'] = "enter_diffbuf",
    ['q'] = "quit",
  },
}

-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------
table.insert(lvim.plugins,
  {
    "jiaoshijie/undotree",
    config = function()
      local ok, undotree = pcall(require, "undotree")
      if ok then
        undotree.setup(config)
      end
    end,
  }
)

-----------------------------------------------------------
-- Key Mappings
-----------------------------------------------------------
local which_key = lvim.builtin.which_key
which_key.mappings["u"] = { "<cmd>lua require('undotree').toggle()<cr>", "UndoTree  " }

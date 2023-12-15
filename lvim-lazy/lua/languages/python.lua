-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------
table.insert(lvim.plugins, { "mfussenegger/nvim-dap-python" }) -- nvim-dap extension to test and debug python

-----------------------------------------------------------
-- Which-Key Config
-----------------------------------------------------------
local which_key = lvim.builtin.which_key

local mappings = {
  name = "Python  ",
  t = { "<cmd>lua require('dap-python').test_method()<cr>", "Test Method" },
  T = { "<cmd>lua require('dap-python').test_class()<cr>", "Test Class" },
  d = { "<cmd>lua require('dap-python').debug_selection()<cr>", "Debug Selection" },
}

which_key["m"]["p"] = mappings

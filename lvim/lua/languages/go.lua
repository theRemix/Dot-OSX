-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------
table.insert(lvim.plugins, { "olexsmir/gopher.nvim" }) -- plugin for easy golang development
table.insert(lvim.plugins, { "leoluz/nvim-dap-go" })   -- extension for nvim-dap providing configurations for launching go debugger (delve) and debugging individual tests

-----------------------------------------------------------
-- Which-Key Config
-----------------------------------------------------------
local which_key = lvim.builtin.which_key

local lang_key = "g"
local mappings = {
  name = "Go  ",

  i = { "<cmd>GoInstallDeps<Cr>", "Install Go Dependencies" },
  f = { "<cmd>GoMod tidy<cr>", "Tidy" },
  a = { "<cmd>GoTestAdd<Cr>", "Add Test" },
  A = { "<cmd>GoTestsAll<Cr>", "Add All Tests" },
  e = { "<cmd>GoTestsExp<Cr>", "Add Exported Tests" },
  g = { "<cmd>GoGenerate<Cr>", "Go Generate" },
  G = { "<cmd>GoGenerate %<Cr>", "Go Generate File" },
  c = { "<cmd>GoCmt<Cr>", "Generate Comment" },
  t = { "<cmd>lua require('dap-go').debug_test()<cr>", "Debug Test" },
}

which_key.mappings[which_key.language_prefix][lang_key] = mappings

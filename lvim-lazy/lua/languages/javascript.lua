-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------
table.insert(lvim.plugins, { "mxsdev/nvim-dap-vscode-js" }) -- nvim-dap adapter for vscode-js-debug

-----------------------------------------------------------
-- Which-Key Config
-----------------------------------------------------------
local which_key = lvim.builtin.which_key

local mappings = {
  name = "JavaScript  ",
  i = { "<cmd>TypescriptAddMissingImports<Cr>", "AddMissingImports" },
  o = { "<cmd>TypescriptOrganizeImports<cr>", "OrganizeImports" },
  u = { "<cmd>TypescriptRemoveUnused<Cr>", "RemoveUnused" },
  r = { "<cmd>TypescriptRenameFile<Cr>", "RenameFile" },
  f = { "<cmd>TypescriptFixAll<Cr>", "FixAll" },
  g = { "<cmd>TypescriptGoToSourceDefinition<Cr>", "GoToSourceDefinition" },
}
which_key["m"]["j"] = mappings

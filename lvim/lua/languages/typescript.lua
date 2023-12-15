-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------
table.insert(lvim.plugins, { "jose-elias-alvarez/typescript.nvim" }) -- plugin to write TypeScript

-----------------------------------------------------------
-- Which-Key Config
-----------------------------------------------------------
local which_key = lvim.builtin.which_key

local lang_key = "t"
local mappings = {
  name = "TypeScript  ",

  i = { "<cmd>TypescriptAddMissingImports<Cr>", "AddMissingImports" },
  o = { "<cmd>TypescriptOrganizeImports<cr>", "OrganizeImports" },
  u = { "<cmd>TypescriptRemoveUnused<Cr>", "RemoveUnused" },
  r = { "<cmd>TypescriptRenameFile<Cr>", "RenameFile" },
  f = { "<cmd>TypescriptFixAll<Cr>", "FixAll" },
  g = { "<cmd>TypescriptGoToSourceDefinition<Cr>", "GoToSourceDefinition" },
}

which_key.mappings[which_key.language_prefix][lang_key] = mappings

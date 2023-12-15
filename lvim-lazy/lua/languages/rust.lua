-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------
table.insert(lvim.plugins, { "simrat39/rust-tools.nvim" }) -- tools for better development in rust using neovim's builtin lsp

-----------------------------------------------------------
-- Which-Key Config
-----------------------------------------------------------
local which_key = lvim.builtin.which_key

local mappings = {
  name = "Rust  ",

  a = { "<cmd>RustEmitAsm<CR>", "Show Assembly" },
  b = {
    "<cmd>lua require('lvim.core.terminal')._exec_toggle({ cmd = 'cargo build;read'})<CR>",
    "Cargo build",
  },
  B = { "<cmd>RustRun<CR>", "Run Buffer" },
  c = {
    "<cmd>lua require('lvim.core.terminal')._exec_toggle({ cmd = 'cargo check;read'})<CR>",
    "Cargo check",
  },
  C = { "<cmd>RustOpenCargo<CR>", "Open Cargo" },
  d = { "<cmd>RustDebuggables<CR>", "Debuggables" },
  D = { "<cmd>RustOpenExternalDocs<CR>", "Open Docs" },
  e = { "<cmd>RustOpenExternalDocs<CR>", "Open External Docs" },
  m = { "<cmd>RustExpandMacro<CR>", "Expand Macro" },
  p = { "<cmd>RustParentModule<CR>", "Parent Module" },
  r = {
    "<cmd>lua require('lvim.core.terminal')._exec_toggle({ cmd = 'cargo run;read'})<CR>",
    "Cargo run",
  },
  R = { "<cmd>RustRunnables<CR>", "Runnables" },
  S = {
    "<cmd>RustStartStandaloneServerForBuffer<CR>",
    "Standalone Server",
  },
  t = {
    "<cmd>lua require('lvim.core.terminal')._exec_toggle({ cmd = 'cargo test -- --nocapture;read'})<CR>",
    "Cargo test",
  },
  v = { "<cmd>RustViewCrateGraph<CR>", "View Crate Graph" },
  w = {
    "<cmd>lua require('rust-tools/workspace_refresh')._reload_workspace_from_cargo_toml()<CR>",
    "Reload Workspace",
  },
}

which_key["m"]["r"] = mappings

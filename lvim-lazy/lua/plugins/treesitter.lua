--[[
 _                   _ _   _
| |_ ___ ___ ___ ___|_| |_| |_ ___ ___
|  _|  _| -_| -_|_ -| |  _|  _| -_|  _|
|_| |_| |___|___|___|_|_| |_| |___|_|

Tree-sitter parses code even while it's being edited.
Provides syntax highlighting, code analysis, and incremental selection.
https://tree-sitter.github.io/tree-sitter/

--]]
local treesitter = lvim.builtin.treesitter

treesitter.ensure_installed = {
  "bash",
  "css",
  "go",
  "javascript",
  "json",
  "lua",
  "python",
  "rust",
  "tsx",
  "typescript",
  "yaml",
}

treesitter.ignore_install = {
  "haskell",
  "java",
}

treesitter.highlight.enabled = true

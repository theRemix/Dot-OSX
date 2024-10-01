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

-----------------------------------------------------------
-- Folding with Treesitter
-----------------------------------------------------------
local opt = vim.opt

-- https://github.com/nvim-treesitter/nvim-treesitter#folding
-- look for foldenable: https://github.com/neovim/neovim/blob/master/src/nvim/options.lua
-- Vim cheatsheet, look for folds keys: https://devhints.io/vim
opt.foldmethod = "expr" -- default is "normal"
opt.foldexpr = "nvim_treesitter#foldexpr()" -- default is ""
opt.foldenable = false -- if this option is true and fold method option is other than normal, every time a document is opened everything will be folded.
-- autocmd to create all folds then open them back up again
vim.api.nvim_create_autocmd({ "BufEnter" }, { pattern = { "*" }, command = "normal zx zR" })

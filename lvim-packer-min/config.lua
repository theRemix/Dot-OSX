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

 - remove duplicate configs that are set in lvim defaults
 - make reloading config a which-key shortcut
--]]

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.lint_on_save = true

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

local sources = {
	"plugins",
	"core.options",
	"core.keymaps",
	"core.autocmds",

	-- [[ Recommended ]] --
	"basic/alpha",
	"basic/easymotion",
	"basic/hlargs",
	"basic/indentlines",
	"basic/lualine",
	"basic/null-ls",
	"basic/telescope",
	"basic/which_key",
	"basic/treesitter",

	-- [[ Optional: Enable if desired ]] --
	"optional/terminal",
	"optional/lspkind",

	-- "lsp/go",
	-- "lsp/javascript",
	-- "lsp/python",
	-- -- "lsp/rust",
	-- "lsp/sh",

	-- "plugins",
}

for _, source in ipairs(sources) do
	local status_ok, fault = pcall(require, source)
	if not status_ok then
		error("Failed to load source " .. source .. "---- ----" .. fault)
	end
end

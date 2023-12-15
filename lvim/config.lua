--[[
 .          __         __                  __                       ___ __
 .--------.|__|.-----.|__|.--------.---.-.|  |   .----.-----.-----.'  _|__|.-----.
 |        ||  ||     ||  ||        |  _  ||  |   |  __|  _  |     |   _|  ||  _  |
 |__|__|__||__||__|__||__||__|__|__|___._||__|   |____|_____|__|__|__| |__||___  |
 .                                                                         |_____|


After making any change, run
:source ~/.config/lvim/config.lua # or path to where this file is
:LvimReload
(probably just quit and restart lunarvim)

After changing plugin config, exit and reopen LunarVim, Run :Lazy sync

Resources
- Read the docs: https://www.lunarvim.org/docs/configuration
- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
- Forum: https://www.reddit.com/r/lunarvim/
- Discord: https://discord.com/invite/Xb9B4Ny

--
@TODO
 - remove duplicate configs that are set in lvim defaults
 - make reloading config a which-key shortcut

--]]

local sources = {
	"core/plugins",
	"core/options",
	"core/keymaps",

	-- [[ Recommended ]] --
	"plugins/which_key", -- load first for initial remappings
	"plugins/alpha",
	"plugins/easymotion",
	"plugins/hlargs",
	"plugins/indentlines",
	"plugins/lualine",
	"plugins/lspkind",
	"plugins/null-ls",
	"plugins/symbols-outline",
	"plugins/telescope",
	"plugins/treesitter",
	"plugins/undotree",

	-- [[ Optional ]] --
	"plugins/copilot",
	-- "plugins/terminal",
	"plugins/spectre",

	-- [[ Language Specific ]] --
	"languages/bash",
	"languages/go",
	"languages/javascript",
	-- "languages/javascriptreact",
	"languages/python",
	-- "languages/rust",
	"languages/terraform",
	"languages/typescript",
	-- "languages/typescriptreact",
}

for _, source in ipairs(sources) do
	local status_ok, fault = pcall(require, source)
	if not status_ok then
		error("Failed to load source " .. source .. "---- ----" .. fault)
	end
end

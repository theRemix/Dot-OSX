--[[
 ___ _____ ___
|  _|     | . |
|___|_|_|_|  _|
.         |_|

Overrides <Tab> which interferes with Copilot autocompletes.

See https://github.com/hrsh7th/nvim-cmp

--]]
local ok, cmp = pcall(require, "cmp")
if ok then
	lvim.builtin.cmp.mapping = cmp.mapping.preset.insert({
		["<Up>"] = cmp.mapping.select_prev_item(),
		["<Down>"] = cmp.mapping.select_next_item(),
		["<C-Space>"] = cmp.mapping.complete(),
		["<Esc>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	})
	lvim.builtin.cmp.mapping["<Tab>"] = nil
end

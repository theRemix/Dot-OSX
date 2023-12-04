--[[
  __          __                                     
 |  |_.-----.|  |.-----.-----.----.-----.-----.-----.
 |   _|  -__||  ||  -__|__ --|  __|  _  |  _  |  -__|
 |____|_____||__||_____|_____|____|_____|   __|_____|
.                                       |__|         

telescope.nvim is a highly extendable fuzzy finder over lists. 
Built on the latest awesome features from neovim core. 
Telescope is centered around modularity, allowing for easy customization.

Dependencies:
- BurntSushi/ripgrep (install native rg binary)
- nvim-lua/plenary.nvim (in plugins.lua) 
- telescope-fzf-native.nvim (in plugins.lua)

See :help telescope.nvim
https://github.com/nvim-telescope/telescope.nvim

--]]

local telescope = lvim.builtin.telescope

telescope.defaults.file_ignore_patterns = { ".git" }

local ok, actions = pcall(require, "telescope.actions")
if ok then
	local okk, action_state = pcall(require, "telescope.actions.state")
	if okk then
		local telescope_custom_actions = {}
		function telescope_custom_actions._multiopen(prompt_bufnr, open_cmd)
			local picker = action_state.get_current_picker(prompt_bufnr)
			-- local selected_entry = action_state.get_selected_entry()
			local num_selections = #picker:get_multi_selection()
			if not num_selections or num_selections <= 1 then
				actions.add_selection(prompt_bufnr)
			end
			actions.send_selected_to_qflist(prompt_bufnr)
			vim.cmd("cfdo " .. open_cmd)
		end
		function telescope_custom_actions.multi_selection_open_vsplit(prompt_bufnr)
			telescope_custom_actions._multiopen(prompt_bufnr, "vsplit")
		end
		function telescope_custom_actions.multi_selection_open_split(prompt_bufnr)
			telescope_custom_actions._multiopen(prompt_bufnr, "split")
		end
		function telescope_custom_actions.multi_selection_open_tab(prompt_bufnr)
			telescope_custom_actions._multiopen(prompt_bufnr, "tabe")
		end
		function telescope_custom_actions.multi_selection_open(prompt_bufnr)
			telescope_custom_actions._multiopen(prompt_bufnr, "edit")
		end

		local mappings = telescope.defaults.mappings

		-- Change Telescope navigation to use j and k for navigation in both input and normal mode.
		mappings.i["<C-j>"] = actions.move_selection_next
		mappings.i["<C-k>"] = actions.move_selection_previous
		mappings.n["<C-j>"] = actions.move_selection_next
		mappings.n["<C-k>"] = actions.move_selection_previous

		-- Change Telescope navigation to use up/p down/n for history in both input and normal mode.
		mappings.i["<C-n>"] = actions.cycle_history_next
		mappings.i["<C-p>"] = actions.cycle_history_prev
		mappings.n["<down>"] = actions.cycle_history_next
		mappings.n["<up>"] = actions.cycle_history_prev

		-- select multiple files with <tab> then multiopen
		mappings.i["<CR>"] = telescope_custom_actions.multi_selection_open
		mappings.i["<C-v>"] = telescope_custom_actions.multi_selection_open_vsplit
		mappings.i["<C-s>"] = telescope_custom_actions.multi_selection_open_split
		mappings.i["<C-t>"] = telescope_custom_actions.multi_selection_open_tab

		-- telescope.on_config_done = function()
	end
end

lvim.builtin.telescope.pickers.find_files = {
	layout_strategy = "horizontal",
	layout_config = {
		width = 0.65,
	},
}

lvim.builtin.telescope.pickers.buffers = {
	layout_strategy = "horizontal",
	layout_config = {
		width = 0.65,
	},
}

lvim.builtin.telescope.pickers.live_grep = {
	layout_strategy = "horizontal",
	layout_config = {
		width = 0.65,
	},
}
-- enable file preview for file_finder and git_files
-- lvim.builtin.telescope.pickers.find_files.previewer = lvim.builtin.telescope.previewers.vim_buffer_cat.new
-- lvim.builtin.telescope.defaults.layout_config.width = 0.98
-- lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 40
-- lvim.builtin.telescope.pickers.find_files({ layout_strategy = "vertical", layout_config = { width = 0.5 } })

-- normal_mode["<C-xxx>"] = "<cmd>Telescope git_files<cr>"
-- normal_mode["<leader>fh"] = lvim.builtin.help_tags
-- normal_mode["<C-xxx>"] = "<cmd>Telescope treesitter<cr>"
-- normal_mode["<C-xxx>"] = "<cmd>Telescope lsp_document_symbols<cr>"
-- normal_mode["z="] = "<cmd>Telescope spell_suggest<cr>"

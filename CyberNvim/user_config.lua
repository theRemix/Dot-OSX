-- use a user/user_config.lua file to provide your own configuration

local M = {}

-- add any null-ls sources you want here
M.setup_sources = function(b)
	return {
		-- b.formatting.autopep8,
		b.code_actions.gitsigns,
	}
end

-- add mason sources to auto-install
M.mason_ensure_installed = {
	null_ls = {
		"stylua",
		"jq",
	},
	dap = {
		"python",
		"delve",
	},
}

-- add servers to be used for auto formatting here
M.formatting_servers = {
	-- ["rust_analyzer"] = { "rust" },
	["lua_ls"] = { "lua" },
	["null_ls"] = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
}

-- options you put here will override or add on to the default options
M.options = {
	opt = {
		confirm = true, -- idk what this is
	},
}

-- Set any to false that you want disabled in here.
-- take a look at the autocommands file in lua/core for more information
-- Default value is true if left blank
M.autocommands = {
	alpha_folding = true,
	treesitter_folds = true,
	trailing_whitespace = true,
	remember_file_state = true,
	session_saved_notification = true,
	css_colorizer = true,
	cmp = true,
}

-- set to false to disable plugins
-- Default value is true if left blank
M.enable_plugins = {
	-- A code outline window for skimming and quick navigation
	aerial = true,

	alpha = true,
	autotag = true,
	bufferline = true,
	context = true,
	copilot = true,
	dressing = true,
	gitsigns = true,
	hop = true,
	img_clip = true,
	indent_blankline = true,
	lsp_zero = true,
	lualine = true,
	neodev = true,
	neoscroll = true,

  -- File explorer
	neotree = true,

	session_manager = true,
	noice = true,
	null_ls = true,
	autopairs = true,
	cmp = true,
	colorizer = true,
	dap = true,
	notify = true,
	surround = true,
	treesitter = true,
	ufo = true,
	onedark = true,
	project = true,
	rainbow = true,
	scope = true,
	telescope = true,
	toggleterm = true,
	trouble = true,
	twilight = true,
	whichkey = true,
	windline = true,
	zen = true,
}

-- add extra plugins in here
M.plugins = {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
		},
	},
	{
		"LunarVim/lunar.nvim", -- themes
	},
	{
		"nvim-lualine/lualine.nvim", -- lualine theme
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    config = function () require("copilot_cmp").setup() end,
    dependencies = {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      config = function()
        require("copilot").setup({
          suggestion = { enabled = false },
          panel = { enabled = false },
        })
      end,
    },
  },

  -- seamless navigation between tmux panes and vim splits
  { "alexghergh/nvim-tmux-navigation" },

  -- golang
  { "olexsmir/gopher.nvim" },
  { "leoluz/nvim-dap-go" },

}

-- add extra configuration options here, like extra autocmds etc.
-- feel free to create your own separate files and require them in here
M.user_conf = function()
  -- local insert_mode = vim.api.nvim_set_keymap

	vim.cmd([[
  autocmd VimEnter * lua vim.notify("Welcome to CyberNvim!", "info", {title = "Neovim"})]])
	-- require("user.autocmds")

	-- color theme
	vim.cmd("colorscheme lunar")
	-- lualine theme
	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = "lunar",
		},
	})

  -- Map "jk" -> ESC
  vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })


  -- cycle through buffers
  vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", {})
  vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", {})

  -- Smarter yank
  --   yanks line starting from cursor
  --   good for yanking to cli
  vim.keymap.set("v", "Y", "y$", {})

  -- setup cmp with copilot
  require("cmp").setup {
    -- other setup
    sources = {
      { name = "copilot" },
      { name = "nvim_lsp" },
      { name = "luasnip" },
    },
  }

  local sources = {
    "user.plugins.whichkey", -- load first
    "user.plugins.hop",
    "user.plugins.tmux-navigation",
  }

  for _, source in ipairs(sources) do
    local status_ok, fault = pcall(require, source)
    if not status_ok then
      vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault)
    end
  end


end

return M

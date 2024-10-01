--[[
 .          __         __                  __                       ___ __
 .--------.|__|.-----.|__|.--------.---.-.|  |   .----.-----.-----.'  _|__|.-----.
 |        ||  ||     ||  ||        |  _  ||  |   |  __|  _  |     |   _|  ||  _  |
 |__|__|__||__||__|__||__||__|__|__|___._||__|   |____|_____|__|__|__| |__||___  |
 .                                                                         |_____|


After making any change, run
:source ~/.config/nvim/init.lua # or path to where this file is

TODO

- qq to close all and quit
- q to close current buffer

--]]
--

-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------
local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  vim.api.nvim_err_writeln("which-key failed to load!")
  return
end

local setup = {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            -- disable so we can use telescope
            enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            -- suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    -- operators = { gc = "Comments" },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    window = {
        border = "rounded", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", -- align columns left, center or right
    },
    ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
    },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  ["c"] = { "<cmd>bdelete<CR>", "Close Buffer" },  -- Close current file
  ["p"] = { "<cmd>Lazy<CR>", "Plugin Manager" }, -- Invoking plugin manager
  ["q"] = { "<cmd>q<CR>", "Quit" }, -- Close tab or Quit Neovim
  ["w"] = { "<cmd>w!<CR>", "Save  " }, -- Save current file

  [";"] = { "<cmd>copen<cr>", "Open Quickfix  " },

  -- Easymotion is mapping h j k and l
  -- remap the original defaults to something else
  -- original "h" : no highlight
  ["H"] = { "<cmd>nohlsearch<CR>", "No Highlight" },

  -- maps <leader>(direction) keys
  ["h"] = { "<cmd>HopWordBC<CR>", "" },         -- Hop ←
  ["j"] = { "<cmd>HopVerticalAC<CR>", "" },     -- Hop ↑
  ["k"] = { "<cmd>HopVerticalBC<CR>", "" },     -- Hop ↓
  ["l"] = { "<cmd>HopWordAC<CR>", "" },         -- Hop →

  -- Telescope
  ["f"] = {
    ["f"] = { "<cmd>Telescope find_files<CR>", "Find Files "},
    ["g"] = { "<cmd>Telescope live_grep<CR>", "Find Text "},
    ["b"] = { "<cmd>Telescope buffers<CR>", "Find Buffers "},
    ["h"] = { "<cmd>Telescope help_tags<CR>", "Help Tags "},
  },

  -- NvimTree
  ["e"] = { "<cmd>Neotree toggle<CR>", "NeoTree 🌳"}, -- open/close
  ["b"] = { "<cmd>Neotree buffers<CR>", "Buffers 🌳"}, -- open/close

  -- Copilot
  ["g"] = {
    name = "GitHub Copilot  ",
    p = {
      "<cmd>Copilot panel<cr>", "Copilot Panel"
    },
    s = {
      "<cmd>call copilot#Suggest()<cr>",
      "Suggest"
    },
    d = {
      "<cmd>Copilot disable<cr>",
      "Disable"
    },
    e = {
      "<cmd>Copilot enable<cr>",
      "Enable"
    },
  },

  ["m"] = {
    name = "Languages  ",

    ["g"] = {
      name = "Go  ",

      i = { "<cmd>GoInstallDeps<Cr>", "Install Go Dependencies" },
      f = { "<cmd>GoMod tidy<cr>", "Tidy" },
      a = { "<cmd>GoTestAdd<Cr>", "Add Test" },
      A = { "<cmd>GoTestsAll<Cr>", "Add All Tests" },
      e = { "<cmd>GoTestsExp<Cr>", "Add Exported Tests" },
      g = { "<cmd>GoGenerate<Cr>", "Go Generate" },
      G = { "<cmd>GoGenerate %<Cr>", "Go Generate File" },
      c = { "<cmd>GoCmt<Cr>", "Generate Comment" },
      t = { "<cmd>lua require('dap-go').debug_test()<cr>", "Debug Test" },
    },
  },

}

which_key.setup(setup)
which_key.register(mappings, opts)

--[[
.                _
 ___ ___ ___ ___| |_ ___ ___
|_ -| . | -_|  _|  _|  _| -_|
|___|  _|___|___|_| |_| |___|
.   |_|

A powerful search, search & replace panel for neovim.

See :help spectre

Get Visual Selection
  make selection, press leader, search or search and replace

--]]

-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------
table.insert(lvim.plugins,
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  }
)

-----------------------------------------------------------
-- Key Mappings
-----------------------------------------------------------
local which_key = lvim.builtin.which_key
which_key.mappings["r"] = {
  name = "Find and Replace  ",
  p = {
    "<cmd>lua require('spectre').open_file_search()<cr>",
    "Search & Replace in current buffer",
  },
  r = {
    "<cmd>lua SpectreSelection()<cr>",
    "Search & Replace",
  },
}

which_key.vmappings["r"] = {
  name = "Find and Replace  ",
  s = {
    "<cmd>lua GrepSelectionInBuffer()<cr>",
    "Search Selection in Buffer",
  },
  S = {
    "<cmd>lua GrepSelection()<cr>",
    "Search Selection",
  },
}

-----------------------------------------------------------
-- Get Visual Selection
--   requires telescope
-----------------------------------------------------------
-- https://github.com/nvim-telescope/telescope.nvim/issues/1923#issuecomment-1122642431
local function getVisualSelection()
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg("v")
  vim.fn.setreg("v", {})

  text = string.gsub(text, "\n", "")
  if #text > 0 then
    return text
  else
    return ""
  end
end

function GrepSelectionInBuffer()
  local input = getVisualSelection()
  require("telescope.builtin").current_buffer_fuzzy_find({ default_text = input })
end

function GrepSelection()
  local input = getVisualSelection()
  require("telescope.builtin").live_grep({ default_text = input })
end

function SpectreSelection()
  local input = getVisualSelection()
  require("spectre").open({ search_text = input })
end

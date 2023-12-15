--[[
.              _       _                 _   _ _
 ___ _ _ _____| |_ ___| |___ ___ ___ _ _| |_| |_|___ ___
|_ -| | |     | . | . | |_ -|___| . | | |  _| | |   | -_|
|___|_  |_|_|_|___|___|_|___|   |___|___|_| |_|_|_|_|___|
.   |___|

tree like view for symbols in Neovim using the Language Server Protocol

See :help symbols-outline

--]]

-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------
table.insert(lvim.plugins,
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      local ok, symbols_outline = pcall(require, "symbols-outline")
      if ok then
        symbols_outline.setup()
      end
    end,
  }
)

-----------------------------------------------------------
-- Key Mappings
-----------------------------------------------------------
local which_key = lvim.builtin.which_key
which_key.mappings["L"]["o"] = { "<cmd>SymbolsOutline<cr>", "Symbols" }

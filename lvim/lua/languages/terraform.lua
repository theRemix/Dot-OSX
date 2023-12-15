-----------------------------------------------------------
-- Tfdoc
-----------------------------------------------------------
vim.cmd([[
    if executable('tfdoc')
        command! -nargs=* Tfdoc :call system('tfdoc' . ' ' . <q-args>)
    endif

]])

-----------------------------------------------------------
-- Which-Key Config
-----------------------------------------------------------
local which_key = lvim.builtin.which_key

local lang_key = "h"
local mappings = {
  name = "Terraform  ",
  h = { "<cmd>Tfdoc<Cr>", "TFDoc" },
}

which_key.mappings[which_key.language_prefix][lang_key] = mappings

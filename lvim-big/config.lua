-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

--[[

░█████╗░░█████╗░███╗░░██╗███████╗██╗░██████╗░░░░██╗░░░░░██╗░░░██╗░█████╗░
██╔══██╗██╔══██╗████╗░██║██╔════╝██║██╔════╝░░░░██║░░░░░██║░░░██║██╔══██╗
██║░░╚═╝██║░░██║██╔██╗██║█████╗░░██║██║░░██╗░░░░██║░░░░░██║░░░██║███████║
██║░░██╗██║░░██║██║╚████║██╔══╝░░██║██║░░╚██╗░░░██║░░░░░██║░░░██║██╔══██║
╚█████╔╝╚█████╔╝██║░╚███║██║░░░░░██║╚██████╔╝██╗███████╗╚██████╔╝██║░░██║
░╚════╝░░╚════╝░╚═╝░░╚══╝╚═╝░░░░░╚═╝░╚═════╝░╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝

--]]

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.lint_on_save = true
-- lvim.colorscheme = "onedark"
lvim.colorscheme = "lunar"

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"


local sources = {
    "core.options",
    "core.keymaps",
    "core.autocmds",

    "config/hlargs",
    "config/indentlines",
    "config/lspkind",
    "config/lualine",
    "config/null-ls",
    "config/telescope",
    "config/treesitter",
    "config/which_key",

    "lsp/go",
    "lsp/javascript",
    "lsp/python",
    -- "lsp/rust",
    "lsp/sh",

    "plugins",
}

for _, source in ipairs(sources) do
    local status_ok, fault = pcall(require, source)
    if not status_ok then
        error("Failed to load source " .. source .. "---- ----" .. fault)
    end
end
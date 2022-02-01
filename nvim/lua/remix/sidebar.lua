sidebar = require("sidebar-nvim")
sidebar.setup({
    disable_default_keybindings = 1,
    bindings = { 
        ["q"] = function() sidebar.close() end
    },
    open = false,
    side = "left",
    initial_width = 35,
    hide_statusline = false,
    update_interval = 1000,
    sections = { "files", "symbols", "buffers", "git", "diagnostics", "todos" },
    section_separator = {"", "-----", ""},
    files = {
        icon = "♔",
        show_hidden = false,
        ignored_paths = {"%.git$"}
    },
    symbols = {
        icon = "ƒ",
    },
    todos = { 
        icon = "",
        ignored_paths = {'~'}, -- ignore certain paths, this will prevent huge folders like $HOME to hog Neovim with TODO searching
        initially_closed = false, -- whether the groups should be initially closed on start. You can manually open/close groups later.
        ignored_paths = { "~" } 
    },
    buffers = {
        icon = "",
        ignored_buffers = {} -- ignore buffers by regex
    },
    disable_closing_prompt = false
})

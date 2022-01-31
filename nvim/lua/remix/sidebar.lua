require("sidebar-nvim").setup({
    disable_default_keybindings = 1,
    bindings = { ["q"] = function() require("sidebar-nvim").close() end },
    open = false,
    side = "left",
    initial_width = 35,
    hide_statusline = false,
    update_interval = 1000,
    sections = { "files", "symbols", "buffers", "git", "diagnostics", "todos" },
    section_separator = {"", "-----", ""},
    files = {
        icon = "",
        show_hidden = false,
        ignored_paths = {"%.git$"}
    },
    symbols = {
        icon = "ƒ",
    },
    todos = { ignored_paths = { "~" } },
    buffers = {
        icon = "",
        ignored_buffers = {} -- ignore buffers by regex
    },
    disable_closing_prompt = false
})

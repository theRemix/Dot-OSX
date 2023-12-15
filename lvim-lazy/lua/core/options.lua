local opt = vim.opt

-----------------------------------------------------------
-- LunarVim General
-----------------------------------------------------------
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
lvim.colorscheme = "lunar"    -- :colorscheme <Tab><Tab>
opt.relativenumber = true     -- show relative distance between rows
opt.showtabline = 0           -- never display page tab labels (default 2)
opt.syntax = "enable"         -- enable syntax highlighting
opt.colorcolumn = "99999"     -- fixes indentline for now
opt.cmdheight = 1             -- more space in the neovim command line for displaying messages
opt.wrap = true               -- wrap lines
opt.guifont = "monospace:h17" -- the font used in graphical neovim applications

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true     -- enable background buffers
opt.history = 100     -- remember n lines in history
opt.lazyredraw = true -- faster scrolling
opt.synmaxcol = 240   -- max column for syntax highlight
opt.timeoutlen = 200  -- determine the behavior when part of a key code sequence has been received by the (default 1000);
opt.updatetime = 50   -- shorten delay; (default is 4000 ms = 4 s) leads to noticeable (default 100)

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.smartindent = true  -- autoindent new lines
opt.autoindent = true   -- copy indent from current line
opt.expandtab = true    -- Use spaces instead of tabs
opt.smarttab = true     -- Be smart when using tabs
opt.shiftwidth = 2      -- Number of spaces to use for indent and unindent
opt.tabstop = 2         -- Visible width of tabs
opt.foldmethod = "expr" -- use treesitter folding

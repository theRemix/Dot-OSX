--[[
.        __               __
 .-----.|  |.--.--.-----.|__|.-----.-----.
 |  _  ||  ||  |  |  _  ||  ||     |__ --|
 |   __||__||_____|___  ||__||__|__|_____|
 |__|             |_____|

After making changes, run
:LvimReload

See https://www.lunarvim.org/docs/plugins

--]]

lvim.plugins = {

  { "romgrk/nvim-treesitter-context" },           -- show code context
  { "kevinhwang91/nvim-bqf",         ft = "qf" }, -- better quickfix window in Neovim, polish old quickfix windo
  { "m-demare/hlargs.nvim" },                     -- highlight arguments' definitions and usages, using treesitter
  { "onsails/lspkind-nvim" },                     -- vscode-like pictograms for neovim lsp completion items
  { "tpope/vim-surround" },                       -- quoting/parenthesizing made simple
  { "christoomey/vim-tmux-navigator" },           -- seamless navigation between tmux panes and vim splits

  {                                               -- highlight, list and search todo comments in your projects
    "folke/todo-comments.nvim",
    config = function()
      local ok, todo = pcall(require, "todo-comments")
      if ok then
        todo.setup()
      end
    end,
  },

}

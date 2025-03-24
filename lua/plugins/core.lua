return {
  { "wuelnerdotexe/vim-enfocado", lazy = true },
  { "nyoom-engineering/oxocarbon.nvim", lazy = true },
  {
    "dasupradyumna/midnight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      HighlightGroup = {
        bg = "none",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "midnight",
      defaults = {
        autocmds = true,
        keymaps = false,
      },
      news = {
        lazyvim = true,
        neovim = true,
      },
    },
  },
}

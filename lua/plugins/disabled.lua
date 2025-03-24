return {
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        view = "cmdline",
      },
    },
  },
  {
    "folke/flash.nvim",
    keys = {
      -- disable the default flash keymap
      { "s", mode = { "n", "x", "o" }, false },
    },
  },
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  {
    "echasnovski/mini.animate",
    enabled = false,
  },
}

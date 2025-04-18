return {
  "zbirenbaum/copilot.lua",
  dependencies = { "giuxtaposition/blink-cmp-copilot" },
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "BufReadPost",
  opts = {
    suggestion = {
      enabled = not vim.g.ai_cmp,
      auto_trigger = true,
      hide_during_completion = vim.g.ai_cmp,
      keymap = {
        accept = '<A-l>',
        next = "<A-k>",
        prev = "<A-j>",
      },
    },
    panel = { enabled = false },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
}

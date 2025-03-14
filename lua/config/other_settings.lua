vim.g.UltiSnipsSnippetDirectories = {"UltiSnips", vim.fn.expand('%:p:h')}
vim.g.UltiSnipsSnippetsDir = "UltiSnips"
vim.g.UltiSnipsExpandTrigger = "<c-l>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-l>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-h>"
-- vim.g.UltiSnipsEditSplit = "vertical"
vim.api.nvim_set_keymap('n', '<leader>asdf', ':UltiSnipsEdit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fdsa', ':e %:e.snippets<CR>', { noremap = true, silent = true })

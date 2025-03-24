local function au(event, opts)
  vim.api.nvim_create_autocmd(event, opts)
end

au({ "FileType" }, {
  pattern = { "markdown", "html", "typescript", "typescriptreact" },
  callback = function()
    vim.cmd("setlocal ts=2 sw=2 sts=2")
  end,
})

au({ "FileType" }, {
  pattern = "gitcommit",
  callback = function()
    vim.cmd("setlocal tw=72")
  end,
})

au({ "BufNewFile" }, {
  pattern = "*",
  callback = function()
    vim.cmd("silent! 0r ~/.config/nvim/templates/template." .. vim.fn.expand("%:e"))
  end,
})

au({ "TabLeave" }, {
  pattern = "*",
  callback = function()
    vim.cmd("let g:lasttab = tabpagenr()")
  end,
})

au({ "BufReadPost" }, {
  pattern = "*",
  callback = function()
    if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.cmd("normal! g'\"")
    end
  end,
})

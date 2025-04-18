local function au(event, opts)
    vim.api.nvim_create_autocmd(event, opts)
end

au({"FileType"}, {
       pattern = {"markdown", "html", "typescript", "typescriptreact"},
       callback = function()
           vim.cmd("setlocal ts=2 sw=2 sts=2")
       end
    })

au({"FileType"}, {
       pattern = {"html"},
       callback = function () vim.opt_local.textwidth = 120 end
    })


au({"FileType"}, {
       pattern = "gitcommit",
       callback = function () vim.opt_local.textwidth = 72 end
    })

au({"BufNewFile"}, {
    pattern = "*",
    callback = function()
        vim.cmd("silent! 0r ~/.config/nvim/templates/template." .. vim.fn.expand("%:e"))
    end
})


au({"TabLeave"}, {
       pattern = "*",
       callback = "let g:lasttab = tabpagenr()"
   })

au({"BufReadPost"}, {
    pattern = "*",
    callback = function()
        if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.cmd("normal! g'\"")
        end
    end
})

au("FileType", {
    pattern = "python",
    callback = function()
        filename = vim.fn.expand("%:t")
        if filename:match(".ju.py$") then
            vim.bo.filetype = "jupynium"
            vim.cmd("setlocal syntax=python")
        end
    end
})

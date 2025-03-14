local function au(event, opts)
    vim.api.nvim_create_autocmd(event, opts)
end

au({"FileType"}, {
       pattern = {"markdown", "html", "typescript", "typescriptreact"},
       callback = "setlocal ts=2 sw=2 sts=2"
    })

au({"FileType"}, {
       pattern = {"markdown", "html"},
       callback = "setlocal tw=1000"
    })


au({"FileType"}, {
       pattern = "gitcommit",
       callback = "setlocal tw=72"
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


au({"BufWritePre"}, {
    pattern = {"*.txt", "*.js", "*.py", "*.wiki", "*.sh", "*.coffee", "*.jl"},
    callback = function()
        vim.cmd("call CleanExtraSpaces()")
    end
})


vim.api.nvim_create_augroup("enfocado_customization", { clear = true })

vim.api.nvim_create_autocmd("ColorScheme", {
    group = "enfocado_customization",
    pattern = "enfocado",
    nested = true,
    callback = function()
        if vim.o.background == "dark" then
            vim.api.nvim_set_hl(0, "Normal", { ctermbg = "black"})
        end
    end,
})

vim.cmd("colorscheme enfocado")

-- ultisnips --
---------------
vim.g.UltiSnipsSnippetDirectories = {"UltiSnips", vim.fn.expand('%:p:h')}
vim.g.UltiSnipsSnippetsDir = "UltiSnips"
vim.g.UltiSnipsExpandTrigger = "<c-l>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-l>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-h>"
-- vim.g.UltiSnipsEditSplit = "vertical"
vim.api.nvim_set_keymap('n', '<leader>asdf', ':UltiSnipsEdit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fdsa', ':e %:e.snippets<CR>', { noremap = true, silent = true })

-- tex conceal --
-----------------
vim.o.conceallevel = 1
vim.g.tex_conceal = 'abdmg'
vim.cmd('hi Conceal ctermbg=none')


-- neomake --
-------------
vim.g.neomake_python_enabled_makers = {'pylint'}
vim.g.neomake_cpp_enable_makers = {'clang'}
vim.g.neomake_cpp_clang_maker = {exe = 'clang'}
vim.g.neomake_cpp_clang_args = {'-std=c++20', '-Wall', '-Wextra', '-Weverything', '-pedantic'}
vim.cmd('call neomake#configure#automake("nrwi", 500)')


-- Neoformat --
---------------
vim.api.nvim_create_augroup("FormatSettings", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    group = "FormatSettings",
    pattern = "*",
    command = "undojoin | Neoformat"
})
vim.g.latexindent_opt = "-m"

-- Tiny inline diagnostics --
-----------------------------
vim.g.tiny_inline_diagnostics = 1


-- vimtex --
------------
local tex_augroup = vim.api.nvim_create_augroup("Tex", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    group = tex_augroup,
    pattern = "tex",
    callback = function()
        vim.api.nvim_buf_set_keymap(0, 'n', '<leader>vv', ':VimtexView<CR>', { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(0, 'n', '<leader>vc', ':VimtexCompile<CR>', { noremap = true, silent = true })
        vim.opt_local.spell = true
    end,
})

-- Figures in VimTex--
----------------------
vim.api.nvim_set_keymap('i', '<C-f>', '<Esc>:silent exec \'.!inkscape-figures create "\'..vim.fn.getline(\'.\')..\'" "\'..vim.b.vimtex.root..\'/figures/"\'<CR><CR>:w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', ':silent exec \'!inkscape-figures edit "\'..vim.b.vimtex.root..\'/figures/" > /dev/null 2>&1 &\'<CR><CR>:redraw!<CR>', { noremap = true, silent = true })

vim.g.vimtex_view_method = 'zathura'
vim.g.latex_view_general_viewer = 'zathura'

vim.g.surround_108 = "\\begin{\\1environment: \\1}\\r\\end{\\1\\1}"

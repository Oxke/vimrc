return {{"lervag/vimtex", ft={"latex", "tex"},
         config = function()
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
            vim.g.vimtex_view_method = 'zathura'
            vim.g.latex_view_general_viewer = 'zathura'
            -- Figures in VimTex--
            vim.api.nvim_set_keymap('i', '<C-f>', '<Esc>:silent exec \'.!inkscape-figures create "\'..vim.fn.getline(\'.\')..\'" "\'..vim.b.vimtex.root..\'/figures/"\'<CR><CR>:w<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<C-f>', ':silent exec \'!inkscape-figures edit "\'..vim.b.vimtex.root..\'/figures/" > /dev/null 2>&1 &\'<CR><CR>:redraw!<CR>', { noremap = true, silent = true })
         end},
        {"KeitaNakamura/tex-conceal.vim", ft = {"latex", "tex"},
            config=function()
                vim.o.conceallevel = 1
                vim.g.tex_conceal = 'abdmg'
                vim.cmd('hi Conceal ctermbg=none')
            end}}

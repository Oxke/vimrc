return {{"norcalli/nvim-colorizer.lua", opts = {},
         ft={"css","scss","html","xml","javascript","javascriptreact","typescript","typescriptreact","markdown"}},
        { 'Sirver/ultisnips', event = 'InsertEnter'},
        {"jiangmiao/auto-pairs", event = "InsertEnter"},
        {"tpope/vim-surround", event = "VeryLazy",
        config = function()
            vim.g.surround_108 = "\\begin{\\1environment: \\1}\\r\\end{\\1\\1}"
        end},
        {"tpope/vim-fugitive", event = "VeryLazy"},
        {"scrooloose/nerdtree", event = "VeryLazy"},
        {"neomake/neomake", event = "VeryLazy",
        config = function()
            vim.g.neomake_python_enabled_makers = {'pylint'}
            vim.g.neomake_cpp_enable_makers = {'clang'}
            vim.g.neomake_cpp_clang_maker = {exe = 'clang'}
            vim.g.neomake_cpp_clang_args = {'-std=c++20', '-Wall', '-Wextra', '-Weverything', '-pedantic'}
            vim.cmd('call neomake#configure#automake("nrwi", 500)')
        end},
        {"jayli/vim-brainfuck", ft = "brainfuck"},
        {"JuliaEditorSupport/julia-vim"},
        {"sbdchd/neoformat", event = "BufWritePre",
         config = function()
            vim.api.nvim_create_augroup("FormatSettings", { clear = true })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = "FormatSettings",
                pattern = "*",
                command = "undojoin | Neoformat"
            })
            vim.g.latexindent_opt = "-m"
         end},
      {
        "kiyoon/jupynium.nvim",
        ft = "jupynium",
        build = "pip install .",
        opts = {
            jupyter_command = "jupyter notebook",
        }
        -- build = "uv pip install . --python=$HOME/.virtualenvs/jupynium/bin/python",
        -- build = "conda run --no-capture-output -n jupynium pip install .",
      },
      --"rcarriga/nvim-notify",   -- optional
      --"stevearc/dressing.nvim", -- optional, UI for :JupyniumKernelSelect
 }

source ~/.config/nvim/vimrc

lua << END
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'enfocado' }
}

local theme_file = vim.fn.expand("~/.config/theme")
local theme = vim.fn.trim(vim.fn.readfile(theme_file)[1])

vim.cmd("set bg=" .. theme)

END

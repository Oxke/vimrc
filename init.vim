source ~/.config/nvim/vimrc

lua << END
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'enfocado' }
}

END

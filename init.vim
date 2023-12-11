source ~/.config/nvim/vimrc

lua << END
require('lualine').setup {
    options = { theme = 'enfocado' }
}
END

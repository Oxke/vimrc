source ~/.config/nvim/vimrc

lua << END
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'enfocado' }
}
-- Define the path to the theme file
local theme_file = vim.fn.expand("~/.config/theme")

-- Check if the theme file exists and is readable
if vim.fn.filereadable(theme_file) == 1 then
    -- Read the theme from the first line of the file
    local theme = vim.fn.trim(vim.fn.readfile(theme_file)[1])
    
    -- Set the background according to the theme (either 'dark' or 'light')
    vim.cmd("set bg=" .. theme)
end
END

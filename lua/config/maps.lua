vim.g.mapleader = ","

local function map(mode, short, long)
    vim.keymap.set(mode, short, long, { silent = true })
end

-- Visual mode related --
-------------------------
-- visual mode pressing * or # searches for the curent selection
map("v", "*", ":<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>")
map("v", "#", ":<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>")

-- Moving around, tabs, windows and buffers --
----------------------------------------------

map("n", " ", "<c-w>") -- easier move-around

map("n", "<c-w>", ":res +3<cr>") -- window resizing
map("n", "<c-a>", ":vert res -3<cr>") -- window resizing
map("n", "<c-s>", ":res -3<cr>") -- window resizing
map("n", "<c-d>", ":vert res +3<cr>") -- window resizing

map("n", "<cr>", "O<esc>j") -- new line
map("", "<leader><cr>", ":noh<cr>") -- disable highlight

map("n", "<leader>bd", ":Bclose<cr>") -- close current buffer
map("n", "<leader>ba", ":bufdo bd<cr>") -- close all buffers
map("", "<leader>;", ":b#<cr>") -- move to last buffer
map("", "<leader>l", ":bnext<cr>") -- next buffer
map("", "<leader>h", ":bprevious<cr>") -- prev buffer
map("", "<leader>n", ":enew<cr>") -- new buffer

map("n", "<leader>Z", ":mks! ~/.config/nvim/Session.vim<cr>:qa<cr>") -- close the session

map("n", "<leader>tn", ":tabnew<cr>") -- new tab
map("n", "<leader>tvn", ":e ~/.config/nvim/lua<cr>") -- open settings
map("n", "<leader>to", ":tabonly<cr>") -- keep only current tab
map("n", "<leader>tc", ":tabclose<cr>") -- close current tab
map("n", "<leader>tm", ":tabmove<cr>")

vim.g.lasttab = 1
map("n", "<leader>tl", ":tabn ".. vim.g.lasttab .."<cr>")

map("n", "<leader>te", ":e <c-r>=expand('%:p:h')<cr><cr>") -- opens a new tab
                                            -- with the current buffer's path
map("n", "<leader>cd", ":cd %:p:h<cr>:pwd<cr>") -- switch cwd to open buffer dir

-- Editing mappings --
----------------------

map("n", "<c-j>", "mz:m+<cr>`z")                --
map("n", "<c-k>", "mz:m-2<cr>`z")               -- Move a line of text up
map("v", "<c-j>", ":m'>+<cr>`<my`>mzgv`yo`z")   -- or down using <c-[jk]>
map("v", "<c-k>", ":m'<-2<cr>`>my`<mzgv`yo`z")  --

map("", "<leader>m", ":w<cr>")  -- save current buffer
map("", "<leader>.", ":wa<cr>") -- save all buffers

-- quickly commits changes
map("n", "<leader>gg", '!git commit -a -m "AutoCommit" && git push<cr>')

map("n", "<laeder>src", ":luafile $MYVIMRC<cr>") -- reload config

-- Spell checking --
--------------------
map("", "<leader>ss", ":setlocal spell!<cr>") -- toggle spell
map("", "<c-c>", "<esc>[s1z=`]a")             -- correct last typo

-- Misc --
----------
map("n", "<leader>pp", ":setlocal paste!<cr>") -- toggle paste mode

-- sudo save. WARNING: this requires the user to write the password in the first
-- line of the file. It's extremely unsecure and not reccomended at all. It
-- should be used only if really you edited a lot of config and forgot to do it
-- with sudo. It's ALWAYS better to modify the file running `sudo nvim` instead
vim.api.nvim_create_user_command("W", "execute 'w !sudo -S tee % > /dev/null' | edit!", {bang=true})

-- Helper functions --
----------------------
-- Don't close window when deleting a buffer
local function bufclose_close_it()
    local current_buf = vim.api.nvim_get_current_buf()
    local alternate_buf = vim.fn.bufnr('#')
    if vim.fn.buflisted(alternate_buf) == 1 then
        vim.cmd('buffer #')
    else
        vim.cmd('bnext')
    end
    if vim.api.nvim_get_current_buf() == current_buf then
        vim.cmd('enew')
    end
    if vim.fn.buflisted(current_buf) == 1 then
        vim.cmd('bdelete! ' .. current_buf)
    end
end

vim.api.nvim_create_user_command('Bclose', bufclose_close_it, {})

-- change easily from light to dark theme
map("n", "<leader>bgd", ":set bg=dark<cr>")
map("n", "<leader>bgl", ":set bg=light<cr>")

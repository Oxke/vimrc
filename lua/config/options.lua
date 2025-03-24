vim.g.mapleader = ","

local o = vim.opt

-- Editor options
o.nu = true -- line numbers
o.rnu = true -- relative
o.so = 5 -- 5 lines above and below
o.stal = 1 -- show tabs <- tabs >= 1
o.wildmenu = true -- self-explanatory
o.ruler = true -- show current position
o.cmdheight = 0 -- beatiful command bar in status bar
o.hid = true -- abandoned buffer is hidden
o.ignorecase = true -- ignore case when searching
o.smartcase = true -- smarter case matching in search
o.hlsearch = true -- highlight search results
o.incsearch = true -- search act like in browsers
o.magic = true -- "regex"-like in search
o.showmatch = true -- matching brackets
o.splitright = true -- prefer splitting to the right
o.clipboard = "unnamedplus" -- clipboard register
o.syntax = "on" -- self-explanatory
o.ai = true -- copy indent to next line
o.si = true -- be even smarter than that
o.wrap = true -- wrap lines
o.expandtab = true -- spaces instead of tabs
o.smarttab = true -- smart tabs
o.sw = 4 -- 1 tab = 4 spaces
o.ts = 4 -- 1 tab = 4 spaces
o.lbr = true -- break lines
o.tw = 80 -- break lines at 80 chars
o.backspace = "eol,start,indent" -- backspace
-- o.whichwrap += "<,>,h,l"    -- backspace again
o.spelllang = "en_us,it" -- spell checking
o.termguicolors = true -- terminal colors

-- animations disable
vim.g.snacks_animate = false

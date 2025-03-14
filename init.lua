vim.cmd([[
  syntax off
  filetype off
  filetype plugin indent off
]])
require("config.settings")
require("config.maps")
require("config.lazy")
require("config.autocommands")
require("config.other_settings")
vim.cmd([[
  syntax on
  filetype on
  filetype plugin indent on
]])

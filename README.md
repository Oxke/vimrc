# vimrc
My personal vimrc configuration file. It's divided in two parts, the file in
.vimrc (which contains all the things I needed when I used only vim) and the
init.vim file, for some nvim configuration. It is supposed to be for neovim.

## Installation
The installation is pretty straight forward. (vim-plug should be installed)

1. Clone repository into .config/: `git clone https://github.com/Oxke/vimrc`
2. Rename folder to "nvim": `mv vimrc nvim` (if nvim already existing then `mv
   vimrc/* nvim/`)
3. Open neovim and execute `:PlugInstall`

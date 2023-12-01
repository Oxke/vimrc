" Salva con forza
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" => VIM user interface
let mapleader = ","
set nu
set rnu " relative numbers

" => NVIM
set clipboard+=unnamedplus
let g:clipboard = {
            \  'name': 'myClipboard',
            \  'copy': {
            \     '+': 'xclip -selection clipboard',
            \     '*': 'xclip -selection clipboard',
            \   },
            \  'paste': {
            \     '+': 'xclip -o -selection clipboard',
            \     '*': 'xclip -o -selection clipboard',
            \  },
            \  'cache_enabled': 1,
            \}

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en

" Turn on the Wild menu
set wildmenu

" Always show current position
set ruler

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Enable 256 colors palette in Gnome Terminal
" if $COLORTERM == 'gnome-terminal'
"     set t_Co=256
" endif


" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Limelight 

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.2

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 0

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs 
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

autocmd Filetype html Markdown setlocal ts=2 sw=2 sts=2

" Linebreak on 500 characters
set lbr
set tw=80
autocmd Filetype html Markdown setlocal tw=1000

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann

vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" remapping <c-w> to a more sensible <space>
nnoremap <space> <c-w>

" easier window resizing
nnoremap <c-w> :res +3<cr>
nnoremap <c-a> :vert res -3<cr>
nnoremap <c-s> :res -3<cr>
nnoremap <c-d> :vert res +3<cr>

" New line
nnoremap <cr> O<esc>j

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l gt
map <leader>h gT

" mappings for closing a session
nnoremap <leader>Z :mks! ~/.config/nvim/Session.vim<cr>:qa<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>tvn :tabnew ~/.config/nvim/.vimrc<cr> 
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>

"" Swap gj and j in Markdown
" autocmd Filetype Markdown nnoremap <buffer> j gj
" autocmd Filetype Markdown nnoremap <buffer> gj j
" autocmd Filetype Markdown nnoremap <buffer> k gk
" autocmd Filetype Markdown nnoremap <buffer> gk k

" Arrows in Markdown
autocmd BufWritePost *.md silent! %s/-->/\&rarr;/gc
" autocmd BufWritePost * %s/<-/\&larr;/g
" autocmd BufWritePost * %s/<->/\&harr;/g
" autocmd BufWritePost * %s/->>/\&Rarr;/g
" autocmd BufWritePost * %s/<<-/\&Larr;/g
" autocmd BufWritePost * %s/>->/\&rarrtl;/g
" autocmd BufWritePost * %s/<-</\&larrtl;/g
" autocmd BufWritePost * %s/|->/\&mapstoright;/g
" autocmd BufWritePost * %s/<-|/\&mapstoleft;/g
autocmd BufWritePost *.md silent! %s/|->/\&rdsh;/gc
autocmd BufWritePost *.md silent! %s/<=>/\&hArr;/gc
autocmd BufWritePost *.md silent! %s/==>/\&rArr;/gc
" autocmd BufWritePost * %s/<==/\&lArr;/g
" autocmd BufWritePost * %s/====>/\&rAarr;/g
" autocmd BufWritePost * %s/<====/\&lAarr;/g
" autocmd BufWritePost * %s/-->/\&xrarr;/g
" autocmd BufWritePost * %s/<--/\&xlarr;/g
" autocmd BufWritePost * %s/<-->/\&xharr;/g
" autocmd BufWritePost * %s/<==>/\&xhArr;/g
" autocmd BufWritePost * %s/===>/\&xrArr;/g
" autocmd BufWritePost * %s/<===/\&xlArr;/g

" Abbreviazioni varie
autocmd Filetype tex inoremap \ss \sqsubseteq

" Abbreviazioni mrg, markdown
autocmd Filetype markdown inoremap qw<Space> tra l'altro<Space>
autocmd Filetype markdown inoremap Qw<Space> Tra l'altro<Space>
autocmd Filetype markdown nnoremap <Leader>. A.<esc>

" per CL, empty clause □
autocmd Filetype txt imap [] □
autocmd Filetype markdown imap [] □
autocmd Filetype tex imap [] \square
 
" Python aliases
nmap <leader>p :w<cr>:!python %<cr>
nmap <leader>t :w<cr>:!time python %<cr>

" z3 alias
nmap <leader>z :w<cr>:!z3 %<cr>

" C++ aliases
autocmd Filetype cpp nmap <leader>c :w<cr>:!g++ -o %:r % && ./%:r<cr> 

" brainfuck alias
nmap <leader>b :BrainFuck<cr>

" Latex alias
autocmd BufWritePost *.tex silent! execute "!pdflatex % >/dev/null 2>&1 && killall -SIGHUP llpp" | redraw!
"autocmd BufWritePost *.tex call ReDrawPdf()

"let g:pidpdf = system('(llpp %:r.pdf >/dev/null 2>&1 &) && echo $!')
"function! ReDrawPdf ()
"    if !g:pidpdf
"        let g:pidpdf = system('(llpp %:r.pdf >/dev/null 2>&1 &) && echo $!')
"    else
"        silent! execute "!kill -SIGHUP " + g:pidpdf
"    endif
"endfunction


autocmd BufNewFile * silent! 0r ~/.config/nvim/templates/template.%:e

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move a line of text using ALT+[jk]
nmap <C-J> mz:m+<cr>`z
nmap <C-K> mz:m-2<cr>`z
vmap <C-J> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-K> :m'<-2<cr>`>my`<mzgv`yo`z

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

" saving using ,m (file) and ,. (all files)
map <leader>m :w<cr>
map <leader>. :wa<cr>

" Quickly commits changes on git
map <leader>gg :!git commit -a -m "AutoCommit" && git push<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""

" Plugins
call plug#begin()
Plug 'dmerejkowsky/vim-ale'
Plug 'wuelnerdotexe/vim-enfocado' " colorscheme
Plug 'junegunn/goyo.vim' " zen mod
" Plug 'junegunn/limelight.vim'
Plug 'tyru/open-browser.vim' " open in browser link
" Plug 'https://github.com/ap/vim-css-color'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'ncm2/ncm2' " completer
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
" Plug 'ncm2/nmc2-pyclang' " c++ completer    
Plug 'filipekiss/ncm2-look.vim'
Plug 'ncm2/ncm2-ultisnips'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tmhedberg/SimpylFold'
Plug 'junegunn/fzf', {'do': {-> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'fisadev/vim-isort'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdtree'
Plug 'github/copilot.vim'
Plug 'neomake/neomake'
"Plug 'vim-latex/vim-latex'
"Plug 'lervag/vimtex'
Plug 'jayli/vim-brainfuck'
Plug 'jupyter-vim/jupyter-vim'
Plug 'tpope/vim-surround'
call plug#end()

" colorscheme
set termguicolors
set background=dark
let g:enfocado_style = 'neon'
augroup enfocado_customization
    autocmd!
    autocmd ColorScheme enfocado ++nested highlight Normal ctermbg=000000 guibg=000000
augroup END
colorscheme enfocado

let g:airline_theme = 'enfocado'

" Plugins remappings
autocmd filetype markdown nnoremap <leader>g :Goyo<cr>

" Plugin Settings
"autocmd! User GoyoEnter Limelight
"autocmd! User GoyoLeave Limelight!

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
let g:UltiSnipsEditSplit="vertical"
 
" vim-isort
let g:vim_isort_map = '<C-i>'

" ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
let g:python3_host_prog='/usr/bin/python'

" neomake
let g:neomake_python_enabled_makers = ['pylint']
let g:neomake_cpp_enable_makers = ['clang']
let g:neomake_cpp_clang_maker = {'exe': 'clang'}
let g:neomake_cpp_clang_args = ['-std=c++14', '-Wall', '-Wextra', '-Weverything', '-pedantic']
call neomake#configure#automake('nrwi', 500)

" latex
" filetype plugin indent on
" let g:tex_flavor='latex'
" autocmd Filetype tex set sw=2
" autocmd Filetype tex set iskeyword+=:
" let g:vimtex_view_general_viewer = "okular"
" let g:vimtex_view_method = 'zathura'


filetype plugin on
let g:instant_markdown_slow = 1
"let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
let g:instant_markdown_mathjax = 1
"let g:instant_markdown_mermaid = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
let g:instant_markdown_python = 1

nmap <leader>src :w<cr>:source ~/.config/nvim/.vimrc<cr>

let g:ale_html_tidy_executable = "D://TidyHtml//tidy-5.6.0-vc14-64b//bin//tidy.exe"
 let g:ale_linters = {
 \   'css': ['csslint'],
 \   'html': ['tidy'],
 \   'javascript': ['eslint'],
 \   'php': [''],
 \   'python': ['flake8'],
 \}

autocmd FileType python ALEDisable

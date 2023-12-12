" Salva con forza (remember to write password at the beginning of the file)
command! W execute 'w !sudo -S tee % > /dev/null' <bar> edit!

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
"let $LANG='en'
"set langmenu=en

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
filetype plugin indent on
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
map <leader>tvn :tabnew ~/.config/nvim/vimrc<cr> 
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>

"" Swap gj and j in Markdown
" autocmd Filetype Markdown nnoremap <buffer> j gj
" autocmd Filetype Markdown nnoremap <buffer> gj j
" autocmd Filetype Markdown nnoremap <buffer> k gk
" autocmd Filetype Markdown nnoremap <buffer> gk k

" Arrows in Markdown
aug arrows_markdown
    au!
    au BufWritePost *.md %s/-->/\&rarr;/gce
    " au BufWritePost * %s/<-/\&larr;/g
    " au BufWritePost * %s/<->/\&harr;/g
    " au BufWritePost * %s/->>/\&Rarr;/g
    " au BufWritePost * %s/<<-/\&Larr;/g
    " au BufWritePost * %s/>->/\&rarrtl;/g
    " au BufWritePost * %s/<-</\&larrtl;/g
    " au BufWritePost * %s/|->/\&mapstoright;/g
    " au BufWritePost * %s/<-|/\&mapstoleft;/g
    au BufWritePost *.md %s/|->/\&rdsh;/gce
    au BufWritePost *.md %s/<=>/\&hArr;/gce
    au BufWritePost *.md %s/==>/\&rArr;/gce
    " au BufWritePost * %s/<==/\&lArr;/g
    " au BufWritePost * %s/====>/\&rAarr;/g
    " au BufWritePost * %s/<====/\&lAarr;/g
    " au BufWritePost * %s/-->/\&xrarr;/g
    " au BufWritePost * %s/<--/\&xlarr;/g
    " au BufWritePost * %s/<-->/\&xharr;/g
    " au BufWritePost * %s/<==>/\&xhArr;/g
    " au BufWritePost * %s/===>/\&xrArr;/g
    " au BufWritePost * %s/<===/\&xlArr;/g
aug end

" Abbreviazioni mrg, markdown
aug mrgMrkdown
    au!
    au Filetype markdown inoremap qw<Space> tra l'altro<Space>
    au Filetype markdown inoremap Qw<Space> Tra l'altro<Space>
    au Filetype markdown nnoremap <Leader>. A.<esc>
aug end

 
" Save, execute, compile
aug SaveExecuteCompile
    au!
    au Filetype py nmap <S-CR> :w<cr>:!python %<cr>
    au Filetype py nmap <S-CR> :w<cr>:!time python %<cr>

    au Filetype clj nmap <leader>z :w<cr>:!z3 %<cr>

    au Filetype cpp nmap <leader>c :w<cr>:!g++ -o %:r % && ./%:r<cr> 

    au Filetype bf nmap <leader>b :BrainFuck<cr>

    " au BufWritePost *.tex silent! execute "!pdflatex % >/dev/null 2>&1 && killall -SIGHUP llpp" | redraw!
aug end

" let g:pidpdf = system((llpp %:r.pdf >/dev/null 2>&1 &) && echo $!)
" function! ReDrawPdf ()
"     if !g:pidpdf
"         let g:pidpdf = system((llpp %:r.pdf >/dev/null 2>&1 &) && echo $!)
"     else
"         silent! execute "!kill -SIGHUP " + g:pidpdf
"     endif
" endfunction
" autocmd BufWritePost *.tex call ReDrawPdf()

" On new file opens template
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
" Move a line of text using Ctrl+[jk]
"
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

" tex
aug Tex
    au!
    au FileType tex inoremap <leader>neq \begin{equation}<cr>\end{equation}<esc>ko
    au FileType tex inoremap <leader>eq \begin{equation*}<cr>\end{equation*}<esc>ko
    au FileType tex inoremap <leader>nal \begin{align}<cr>\end{align}<esc>ko
    au FileType tex inoremap <leader>al \begin{align*}<cr>\end{align*}<esc>ko
    au FileType tex inoremap <leader>thm \begin{theorem}<cr>\end{theorem}<esc>ko
    au FileType tex inoremap <leader>lem \begin{lemma}<cr>\end{lemma}<esc>ko
    au FileType tex inoremap <leader>prp \begin{proposition}<cr>\end{proposition}<esc>ko
    au FileType tex inoremap <leader>cor \begin{corollary}<cr>\end{corollary}<esc>ko
    au FileType tex inoremap <leader>def \begin{definition}<cr>\end{definition}<esc>ko
    au FileType tex inoremap <leader>ex \begin{example}<cr>\end{example}<esc>ko
    au FileType tex inoremap <leader>rma \begin{remark}<cr>\end{remark}<esc>ko
    au FileType tex inoremap <leader>pf \begin{proof}<cr>\end{proof}<esc>ko
aug end

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
set spelllang=en_us,it
map <leader>ss :setlocal spell!<cr>
map <c-c> <esc>[s1z=`]a

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
" Plug 'honza/vim-snippets'
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
Plug 'lervag/vimtex'
"Plug 'vim-latex/vim-latex'
Plug 'jayli/vim-brainfuck'
Plug 'jupyter-vim/jupyter-vim'
Plug 'tpope/vim-surround'
Plug 'KeitaNakamura/tex-conceal.vim'
call plug#end()

filetype plugin indent on

set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none

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
let g:UltiSnipsSnippetDirectories = ["UltiSnips", expand('%:p:h')]
let g:UltiSnipsSnippetsDir = "UltiSnips"
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
let g:UltiSnipsEditSplit="vertical"

nmap <leader>asdf :UltiSnipsEdit<cr>
nmap <leader>fdsa :vsplit %:e.snippets<cr>
 
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

nmap <leader>src :w<cr>:source ~/.config/nvim/vimrc<cr>

let g:ale_html_tidy_executable = "D://TidyHtml//tidy-5.6.0-vc14-64b//bin//tidy.exe"
 let g:ale_linters = {
 \   'css': ['csslint'],
 \   'html': ['tidy'],
 \   'javascript': ['eslint'],
 \   'php': [''],
 \   'python': ['flake8'],
 \}

set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

autocmd FileType python ALEDisable

" Copilot settings
imap <A-j> <Plug>(copilot-previous)
imap <A-k> <Plug>(copilot-next)

" vimtex watch figures settings
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

let g:vimtex_view_method = 'zathura'

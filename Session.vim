let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Documents/Planisuss/Objects
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +24 World.py
badd +1 Cell.py
badd +1 Ecosystem.py
badd +0 ../Visualization.py
badd +0 ../main.py
badd +0 ../variables.py
argglobal
%argdel
$argadd World.py
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit World.py
argglobal
setlocal fdm=expr
setlocal fde=SimpylFold#FoldExpr(v:lnum)
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
4
normal! zo
18
normal! zo
20
normal! zo
75
normal! zo
118
normal! zo
120
normal! zo
250
normal! zo
339
normal! zo
379
normal! zo
let s:l = 297 - ((28 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 297
normal! 060|
tabnext
edit ../variables.py
argglobal
balt World.py
setlocal fdm=expr
setlocal fde=SimpylFold#FoldExpr(v:lnum)
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 8 - ((7 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 8
normal! 0
tabnext
edit Cell.py
argglobal
balt World.py
setlocal fdm=expr
setlocal fde=SimpylFold#FoldExpr(v:lnum)
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
2
normal! zo
6
normal! zo
9
normal! zo
18
normal! zo
25
normal! zo
33
normal! zo
34
normal! zo
49
normal! zo
52
normal! zo
71
normal! zo
74
normal! zo
77
normal! zo
80
normal! zo
71
normal! zo
74
normal! zo
77
normal! zo
80
normal! zo
84
normal! zo
85
normal! zo
84
normal! zo
85
normal! zo
89
normal! zo
91
normal! zo
let s:l = 58 - ((15 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 58
normal! 031|
tabnext
edit Ecosystem.py
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 96 + 96) / 192)
exe 'vert 2resize ' . ((&columns * 95 + 96) / 192)
argglobal
balt Cell.py
setlocal fdm=expr
setlocal fde=SimpylFold#FoldExpr(v:lnum)
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
9
normal! zo
40
normal! zo
85
normal! zo
90
normal! zo
92
normal! zo
105
normal! zo
117
normal! zo
157
normal! zo
160
normal! zo
185
normal! zo
187
normal! zo
196
normal! zo
200
normal! zo
213
normal! zo
220
normal! zo
240
normal! zo
253
normal! zo
256
normal! zo
290
normal! zo
302
normal! zo
319
normal! zo
338
normal! zo
360
normal! zo
365
normal! zo
376
normal! zo
378
normal! zo
383
normal! zo
388
normal! zo
393
normal! zo
418
normal! zo
442
normal! zo
454
normal! zo
459
normal! zo
482
normal! zo
504
normal! zo
509
normal! zo
510
normal! zo
530
normal! zo
562
normal! zo
578
normal! zo
590
normal! zo
let s:l = 549 - ((21 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 549
normal! 018|
wincmd w
argglobal
if bufexists(fnamemodify("Ecosystem.py", ":p")) | buffer Ecosystem.py | else | edit Ecosystem.py | endif
if &buftype ==# 'terminal'
  silent file Ecosystem.py
endif
balt Cell.py
setlocal fdm=expr
setlocal fde=SimpylFold#FoldExpr(v:lnum)
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
2
normal! zo
90
normal! zo
122
normal! zo
129
normal! zo
160
normal! zo
185
normal! zo
187
normal! zo
213
normal! zo
220
normal! zo
256
normal! zo
290
normal! zo
365
normal! zo
459
normal! zo
460
normal! zo
465
normal! zo
470
normal! zo
475
normal! zo
482
normal! zo
504
normal! zo
530
normal! zo
562
normal! zo
578
normal! zo
590
normal! zo
let s:l = 5 - ((4 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 5
normal! 032|
wincmd w
exe 'vert 1resize ' . ((&columns * 96 + 96) / 192)
exe 'vert 2resize ' . ((&columns * 95 + 96) / 192)
tabnext
edit ../Visualization.py
argglobal
balt Ecosystem.py
setlocal fdm=expr
setlocal fde=SimpylFold#FoldExpr(v:lnum)
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
6
normal! zo
95
normal! zo
101
normal! zo
125
normal! zo
let s:l = 122 - ((23 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 122
normal! 013|
tabnext
edit ../main.py
argglobal
balt ../Visualization.py
setlocal fdm=expr
setlocal fde=SimpylFold#FoldExpr(v:lnum)
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
6
normal! zo
let s:l = 2 - ((1 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 2
normal! 0
tabnext 5
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :

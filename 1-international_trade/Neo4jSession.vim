let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <Plug>NERDCommenterInInsert  <BS>:call NERDComment(0, "insert")
inoremap <Plug>ClojureReplDownHistory :call b:vimclojure_repl.downHistory()
inoremap <Plug>ClojureReplUpHistory :call b:vimclojure_repl.upHistory()
inoremap <Plug>ClojureReplEnterHook :call b:vimclojure_repl.enterHook()
cnoremap <C-F4> c
inoremap <C-F4> c
cnoremap <C-Tab> w
inoremap <C-Tab> w
cmap <S-Insert> +
imap <S-Insert> 
xnoremap  ggVG
snoremap  gggHG
onoremap  gggHG
nnoremap  gggHG
vnoremap  "+y
vnoremap 	 %
nnoremap 	 %
nmap <silent>  :NERDTreeToggle
noremap  
vnoremap  :update
nnoremap  :update
onoremap  :update
nmap  "+gP
omap  "+gP
vnoremap  "+x
noremap  
noremap  u
cnoremap   :simalt ~
inoremap   :simalt ~
nmap + :ZoomIn
nmap - :ZoomOut
vnoremap / /\v
nnoremap / /\v
xmap S <Plug>VSurround
nmap [xx <Plug>unimpairedLineXmlEncode
xmap [x <Plug>unimpairedXmlEncode
nmap [x <Plug>unimpairedXmlEncode
nmap [uu <Plug>unimpairedLineUrlEncode
xmap [u <Plug>unimpairedUrlEncode
nmap [u <Plug>unimpairedUrlEncode
nmap [yy <Plug>unimpairedLineStringEncode
xmap [y <Plug>unimpairedStringEncode
nmap [y <Plug>unimpairedStringEncode
xmap [e <Plug>unimpairedMoveUp
nmap [e <Plug>unimpairedMoveUp
nmap [  <Plug>unimpairedBlankUp
omap [> V:call search('^>>>>>>>','bW')
omap [= V:call search('^=======','bW')
omap [< V:call search('^<<<<<<<','bW')
xmap [> :exe 'norm! gv'|call search('^>>>>>>>','bW')
xmap [= :exe 'norm! gv'|call search('^=======','bW')
xmap [< :exe 'norm! gv'|call search('^<<<<<<<','bW')
nmap [> :call search('^>>>>>>>','bW')
nmap [= :call search('^=======','bW')
nmap [< :call search('^<<<<<<<','bW')
xmap [, :exe 'norm! gv'|call search('^[<=>]\{7\}','bW')
omap [, V:call search('^[<=>]\{7\}','bW')
nmap [, :call search('^[<=>]\{7\}','bW')
nmap [o <Plug>unimpairedOPrevious
nmap <silent> [T <Plug>unimpairedTFirst
nmap <silent> [t <Plug>unimpairedTPrevious
nmap <silent> [Q <Plug>unimpairedQFirst
nmap <silent> [q <Plug>unimpairedQPrevious
nmap <silent> [L <Plug>unimpairedLFirst
nmap <silent> [l <Plug>unimpairedLPrevious
nmap <silent> [B <Plug>unimpairedBFirst
nmap <silent> [b <Plug>unimpairedBPrevious
nmap <silent> [A <Plug>unimpairedAFirst
nmap <silent> [a <Plug>unimpairedAPrevious
map \rwp <Plug>RestoreWinPosn
map \swp <Plug>SaveWinPosn
map \tt <Plug>AM_tt
map \tsq <Plug>AM_tsq
map \tsp <Plug>AM_tsp
map \tml <Plug>AM_tml
map \tab <Plug>AM_tab
map \m= <Plug>AM_m=
map \t@ <Plug>AM_t@
map \t~ <Plug>AM_t~
map \t? <Plug>AM_t?
map \w= <Plug>AM_w=
map \ts= <Plug>AM_ts=
map \ts< <Plug>AM_ts<
map \ts; <Plug>AM_ts;
map \ts: <Plug>AM_ts:
map \ts, <Plug>AM_ts,
map \t= <Plug>AM_t=
map \t< <Plug>AM_t<
map \t; <Plug>AM_t;
map \t: <Plug>AM_t:
map \t, <Plug>AM_t,
map \t# <Plug>AM_t#
map \t| <Plug>AM_t|
map \T~ <Plug>AM_T~
map \Tsp <Plug>AM_Tsp
map \Tab <Plug>AM_Tab
map \T@ <Plug>AM_T@
map \T? <Plug>AM_T?
map \T= <Plug>AM_T=
map \T< <Plug>AM_T<
map \T; <Plug>AM_T;
map \T: <Plug>AM_T:
map \Ts, <Plug>AM_Ts,
map \T, <Plug>AM_T,o
map \T# <Plug>AM_T#
map \T| <Plug>AM_T|
map \Htd <Plug>AM_Htd
map \anum <Plug>AM_aunum
map \aunum <Plug>AM_aenum
map \afnc <Plug>AM_afnc
map \adef <Plug>AM_adef
map \adec <Plug>AM_adec
map \ascom <Plug>AM_ascom
map \aocom <Plug>AM_aocom
map \adcom <Plug>AM_adcom
map \acom <Plug>AM_acom
map \abox <Plug>AM_abox
map \a( <Plug>AM_a(
map \a= <Plug>AM_a=
map \a< <Plug>AM_a<
map \a, <Plug>AM_a,
map \a? <Plug>AM_a?
nmap \ca <Plug>NERDCommenterAltDelims
vmap \cA <Plug>NERDCommenterAppend
nmap \cA <Plug>NERDCommenterAppend
vmap \c$ <Plug>NERDCommenterToEOL
nmap \c$ <Plug>NERDCommenterToEOL
vmap \cu <Plug>NERDCommenterUncomment
nmap \cu <Plug>NERDCommenterUncomment
vmap \cn <Plug>NERDCommenterNest
nmap \cn <Plug>NERDCommenterNest
vmap \cb <Plug>NERDCommenterAlignBoth
nmap \cb <Plug>NERDCommenterAlignBoth
vmap \cl <Plug>NERDCommenterAlignLeft
nmap \cl <Plug>NERDCommenterAlignLeft
vmap \cy <Plug>NERDCommenterYank
nmap \cy <Plug>NERDCommenterYank
vmap \ci <Plug>NERDCommenterInvert
nmap \ci <Plug>NERDCommenterInvert
vmap \cs <Plug>NERDCommenterSexy
nmap \cs <Plug>NERDCommenterSexy
vmap \cm <Plug>NERDCommenterMinimal
nmap \cm <Plug>NERDCommenterMinimal
vmap \c  <Plug>NERDCommenterToggle
nmap \c  <Plug>NERDCommenterToggle
vmap \cc <Plug>NERDCommenterComment
nmap \cc <Plug>NERDCommenterComment
nmap <silent> \b :CommandTBuffer
nmap <silent> \t :CommandT
nnoremap \ff :FufFile
nnoremap \w vl  " Vertical split
nnoremap \  :let @/=''
nnoremap \c :set cursorline! cursorcolumn!
nnoremap <silent> \n :set number         " backslash n to use regular line numbers
nnoremap <silent> \r :set relativenumber " backslash r to use relative numbers
nmap ]xx <Plug>unimpairedLineXmlDecode
xmap ]x <Plug>unimpairedXmlDecode
nmap ]x <Plug>unimpairedXmlDecode
nmap ]uu <Plug>unimpairedLineUrlDecode
xmap ]u <Plug>unimpairedUrlDecode
nmap ]u <Plug>unimpairedUrlDecode
nmap ]yy <Plug>unimpairedLineStringDecode
xmap ]y <Plug>unimpairedStringDecode
nmap ]y <Plug>unimpairedStringDecode
xmap ]e <Plug>unimpairedMoveDown
nmap ]e <Plug>unimpairedMoveDown
nmap ]  <Plug>unimpairedBlankDown
omap ]> V:call search('^>>>>>>>','W')
omap ]= V:call search('^=======','W')
omap ]< V:call search('^<<<<<<<','W')
xmap ]> :exe 'norm! gv'|call search('^>>>>>>>','W')
xmap ]= :exe 'norm! gv'|call search('^=======','W')
xmap ]< :exe 'norm! gv'|call search('^<<<<<<<','W')
nmap ]> :call search('^>>>>>>>','W')
nmap ]= :call search('^=======','W')
nmap ]< :call search('^<<<<<<<','W')
xmap ], :exe 'norm! gv'|call search('^[<=>]\{7\}','W')
omap ], V:call search('^[<=>]\{7\}','W')
nmap ], :call search('^[<=>]\{7\}','W')
nmap ]o <Plug>unimpairedONext
nmap <silent> ]T <Plug>unimpairedTLast
nmap <silent> ]t <Plug>unimpairedTNext
nmap <silent> ]Q <Plug>unimpairedQLast
nmap <silent> ]q <Plug>unimpairedQNext
nmap <silent> ]L <Plug>unimpairedLLast
nmap <silent> ]l <Plug>unimpairedLNext
nmap <silent> ]B <Plug>unimpairedBLast
nmap <silent> ]b <Plug>unimpairedBNext
nmap <silent> ]A <Plug>unimpairedALast
nmap <silent> ]a <Plug>unimpairedANext
nmap cs <Plug>Csurround
nmap ds <Plug>Dsurround
nmap gx <Plug>NetrwBrowseX
xmap gS <Plug>VgSurround
xnoremap <silent> s :echoerr 'surround.vim: Visual mode s has been removed in favor of S'
nmap ySS <Plug>YSsurround
nmap ySs <Plug>YSsurround
nmap yss <Plug>Yssurround
nmap yS <Plug>YSurround
nmap ys <Plug>Ysurround
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
xnoremap <silent> <Plug>unimpairedMoveDown :exe 'normal! m`'|exe '''<,''>move''>+'.v:count1``
xnoremap <silent> <Plug>unimpairedMoveUp :exe 'normal! m`'|exe '''<,''>move--'.v:count1``
nmap <silent> <Plug>unimpairedTLast :exe "tlast ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedTFirst :exe "tfirst ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedTNext :exe "tnext ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedTPrevious :exe "tprevious ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedQLast :exe "clast ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedQFirst :exe "cfirst ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedQNext :exe "cnext ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedQPrevious :exe "cprevious ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedLLast :exe "llast ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedLFirst :exe "lfirst ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedLNext :exe "lnext ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedLPrevious :exe "lprevious ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedBLast :exe "blast ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedBFirst :exe "bfirst ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedBNext :exe "bnext ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedBPrevious :exe "bprevious ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedALast :exe "last ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedAFirst :exe "first ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedANext :exe "next ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedAPrevious :exe "previous ".(v:count ? v:count : "")
nmap <silent> <Plug>RestoreWinPosn :call RestoreWinPosn()
nmap <silent> <Plug>SaveWinPosn :call SaveWinPosn()
nmap <SNR>57_WE <Plug>AlignMapsWrapperEnd
map <SNR>57_WS <Plug>AlignMapsWrapperStart
nmap <silent> <Plug>NERDCommenterAppend :call NERDComment(0, "append")
nnoremap <silent> <Plug>NERDCommenterToEOL :call NERDComment(0, "toEOL")
vnoremap <silent> <Plug>NERDCommenterUncomment :call NERDComment(1, "uncomment")
nnoremap <silent> <Plug>NERDCommenterUncomment :call NERDComment(0, "uncomment")
vnoremap <silent> <Plug>NERDCommenterNest :call NERDComment(1, "nested")
nnoremap <silent> <Plug>NERDCommenterNest :call NERDComment(0, "nested")
vnoremap <silent> <Plug>NERDCommenterAlignBoth :call NERDComment(1, "alignBoth")
nnoremap <silent> <Plug>NERDCommenterAlignBoth :call NERDComment(0, "alignBoth")
vnoremap <silent> <Plug>NERDCommenterAlignLeft :call NERDComment(1, "alignLeft")
nnoremap <silent> <Plug>NERDCommenterAlignLeft :call NERDComment(0, "alignLeft")
vmap <silent> <Plug>NERDCommenterYank :call NERDComment(1, "yank")
nmap <silent> <Plug>NERDCommenterYank :call NERDComment(0, "yank")
vnoremap <silent> <Plug>NERDCommenterInvert :call NERDComment(1, "invert")
nnoremap <silent> <Plug>NERDCommenterInvert :call NERDComment(0, "invert")
vnoremap <silent> <Plug>NERDCommenterSexy :call NERDComment(1, "sexy")
nnoremap <silent> <Plug>NERDCommenterSexy :call NERDComment(0, "sexy")
vnoremap <silent> <Plug>NERDCommenterMinimal :call NERDComment(1, "minimal")
nnoremap <silent> <Plug>NERDCommenterMinimal :call NERDComment(0, "minimal")
vnoremap <silent> <Plug>NERDCommenterToggle :call NERDComment(1, "toggle")
nnoremap <silent> <Plug>NERDCommenterToggle :call NERDComment(0, "toggle")
vnoremap <silent> <Plug>NERDCommenterComment :call NERDComment(1, "norm")
nnoremap <silent> <Plug>NERDCommenterComment :call NERDComment(0, "norm")
nnoremap <Plug>ClojureCloseResultBuffer :call vimclojure#ResultBuffer.CloseBuffer()
nnoremap <Plug>ClojureStartLocalRepl :call vimclojure#ProtectedPlug(function("vimclojure#StartRepl"), [ b:vimclojure_namespace ])
nnoremap <Plug>ClojureStartRepl :call vimclojure#ProtectedPlug(function("vimclojure#StartRepl"), [  ])
nnoremap <Plug>ClojureEvalParagraph :call vimclojure#ProtectedPlug(function("vimclojure#EvalParagraph"), [  ])
nnoremap <Plug>ClojureEvalToplevel :call vimclojure#ProtectedPlug(function("vimclojure#EvalToplevel"), [  ])
vnoremap <Plug>ClojureEvalBlock :call vimclojure#ProtectedPlug(function("vimclojure#EvalBlock"), [  ])
nnoremap <Plug>ClojureEvalLine :call vimclojure#ProtectedPlug(function("vimclojure#EvalLine"), [  ])
nnoremap <Plug>ClojureEvalFile :call vimclojure#ProtectedPlug(function("vimclojure#EvalFile"), [  ])
nnoremap <Plug>ClojureMacroExpand1 :call vimclojure#ProtectedPlug(function("vimclojure#MacroExpand"), [ 1 ])
nnoremap <Plug>ClojureMacroExpand :call vimclojure#ProtectedPlug(function("vimclojure#MacroExpand"), [ 0 ])
nnoremap <Plug>ClojureRunTests :call vimclojure#ProtectedPlug(function("vimclojure#RunTests"), [ 0 ])
nnoremap <Plug>ClojureRequireFileAll :call vimclojure#ProtectedPlug(function("vimclojure#RequireFile"), [ 1 ])
nnoremap <Plug>ClojureRequireFile :call vimclojure#ProtectedPlug(function("vimclojure#RequireFile"), [ 0 ])
nnoremap <Plug>ClojureGotoSourceInteractive :call vimclojure#ProtectedPlug(function("vimclojure#GotoSource"), [ input("Symbol to go to: ") ])
nnoremap <Plug>ClojureGotoSourceWord :call vimclojure#ProtectedPlug(function("vimclojure#GotoSource"), [ expand("<cword>") ])
nnoremap <Plug>ClojureSourceLookupInteractive :call vimclojure#ProtectedPlug(function("vimclojure#SourceLookup"), [ input("Symbol to look up: ") ])
nnoremap <Plug>ClojureSourceLookupWord :call vimclojure#ProtectedPlug(function("vimclojure#SourceLookup"), [ expand("<cword>") ])
nnoremap <Plug>ClojureMetaLookupInteractive :call vimclojure#ProtectedPlug(function("vimclojure#MetaLookup"), [ input("Symbol to look up: ") ])
nnoremap <Plug>ClojureMetaLookupWord :call vimclojure#ProtectedPlug(function("vimclojure#MetaLookup"), [ expand("<cword>") ])
nnoremap <Plug>ClojureFindDoc :call vimclojure#ProtectedPlug(function("vimclojure#FindDoc"), [  ])
nnoremap <Plug>ClojureJavadocLookupInteractive :call vimclojure#ProtectedPlug(function("vimclojure#JavadocLookup"), [ input("Class to lookup: ") ])
nnoremap <Plug>ClojureJavadocLookupWord :call vimclojure#ProtectedPlug(function("vimclojure#JavadocLookup"), [ expand("<cword>") ])
nnoremap <Plug>ClojureDocLookupInteractive :call vimclojure#ProtectedPlug(function("vimclojure#DocLookup"), [ input("Symbol to look up: ") ])
nnoremap <Plug>ClojureDocLookupWord :call vimclojure#ProtectedPlug(function("vimclojure#DocLookup"), [ expand("<cword>") ])
nnoremap <Plug>ClojureAddToLispWords :call vimclojure#ProtectedPlug(function("vimclojure#AddToLispWords"), [ expand("<cword>") ])
vmap <C-Down> ]egv
vmap <C-Up> [egv
nmap <C-Down> ]e
nmap <C-Up> [e
onoremap <C-F4> c
nnoremap <C-F4> c
vnoremap <C-F4> c
onoremap <C-Tab> w
nnoremap <C-Tab> w
vnoremap <C-Tab> w
vmap <S-Insert> 
vnoremap <BS> d
vmap <C-Del> "*d
vnoremap <S-Del> "+x
vnoremap <C-Insert> "+y
nmap <S-Insert> "+gP
omap <S-Insert> "+gP
cnoremap  gggHG
inoremap  gggHG
imap S <Plug>ISurround
imap s <Plug>Isurround
inoremap  :update
cmap  +
inoremap  
inoremap  u
noremap   :simalt ~
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set background=dark
set backspace=indent,eol,start
set copyindent
set encoding=utf-8
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set formatoptions=qrn1
set gdefault
set guifont=Consolas:h11
set guioptions=egmrt
set helplang=En
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set keymodel=startsel,stopsel
set laststatus=2
set listchars=tab:â–¸\ ,eol:Â¬
set ruler
set runtimepath=C:\\mydocs\\.vim\\bundle\\nerdtree,C:\\mydocs\\.vim\\bundle\\L9,C:\\mydocs\\.vim\\bundle\\FuzzyFinder,C:\\mydocs\\.vim\\bundle\\Zenburn,C:\\mydocs\\.vim\\bundle\\vim-colors-solarized,C:\\mydocs\\.vim\\bundle\\Command-T,C:\\mydocs\\.vim\\bundle\\Tabular,C:\\mydocs\\.vim\\bundle\\VimClojure,C:\\mydocs\\.vim\\bundle\\Solarized,C:\\mydocs\\.vim\\bundle\\groovy.vim,C:\\mydocs\\.vim\\bundle\\xml.vim,C:\\mydocs\\.vim\\bundle\\nerdcommenter,C:\\mydocs\\.vim\\bundle\\vim-surround,C:\\mydocs\\.vim\\bundle\\Align,C:\\mydocs\\.vim\\bundle\\vim-fugitive,C:\\mydocs\\.vim\\bundle\\jQuery,C:\\mydocs\\.vim\\bundle\\vim-git,C:\\mydocs\\.vim\\bundle\\Markdown,C:\\mydocs\\.vim\\bundle\\zoom.vim,C:\\mydocs\\.vim\\bundle\\vim-coffee-script,C:\\mydocs\\.vim\\bundle\\vim-javascript,C:\\mydocs\\.vim\\bundle\\vim-unimpaired,C:\\mydocs\\.vim\\bundle\\vim-rails,C:\\mydocs\\.vim\\bundle\\vim-ruby,C:\\mydocs\\.vim\\bundle\\vim-cucumber,C:\\mydocs\\.vim,C:\\mydocs\\.vim\\bundle\\scss-syntax.vim,C:\\mydocs\\vimfiles,C:\\Program\ Files\\Vim/vimfiles,C:\\Program\ Files\\Vim\\vim73,C:\\Program\ Files\\Vim/vimfiles/after,C:\\mydocs\\vimfiles/after,C:\\mydocs\\.vi
set scrolloff=3
set selection=exclusive
set selectmode=mouse,key
set shiftround
set shiftwidth=2
set showmatch
set smartcase
set smartindent
set smarttab
set softtabstop=2
set textwidth=79
set visualbell
set whichwrap=b,s,<,>,[,]
set wildmenu
set wildmode=list:longest
set window=49
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd C:\mydocs\Ruby\puzzlenode\1-international_trade
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 files\RATES.xml
badd +10001 files\TRANS.csv
badd +1 files\SAMPLE_TRANS.csv
badd +1 files\SAMPLE_RATES.xml
badd +1 files\SAMPLE_OUTPUT.txt
badd +31 lib\banker.rb
badd +0 lib\xml_parser.rb
silent! argdel *
edit lib\xml_parser.rb
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 68 + 103) / 206)
exe 'vert 2resize ' . ((&columns * 96 + 103) / 206)
exe '3resize ' . ((&lines * 24 + 25) / 50)
exe 'vert 3resize ' . ((&columns * 40 + 103) / 206)
exe '4resize ' . ((&lines * 23 + 25) / 50)
exe 'vert 4resize ' . ((&columns * 40 + 103) / 206)
argglobal
nnoremap <buffer> <silent> g} :exe        "ptjump =RubyCursorIdentifier()"
nnoremap <buffer> <silent> } :exe          "ptag =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g] :exe      "stselect =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g :exe        "stjump =RubyCursorIdentifier()"
nnoremap <buffer> <silent>  :exe v:count1."stag =RubyCursorIdentifier()"
nnoremap <buffer> <silent> ] :exe v:count1."stag =RubyCursorIdentifier()"
nnoremap <buffer> <silent>  :exe  v:count1."tag =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g] :exe       "tselect =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g :exe         "tjump =RubyCursorIdentifier()"
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=RubyBalloonexpr()
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal copyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=^\\s*#\\s*define
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'ruby'
setlocal filetype=ruby
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=n1croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=^\\s*\\<\\(load\\>\\|require\\>\\|autoload\\s*:\\=[\"']\\=\\h\\w*[\"']\\=,\\)
setlocal includeexpr=substitute(substitute(v:fname,'::','/','g'),'$','.rb','')
setlocal indentexpr=GetRubyIndent(v:lnum)
setlocal indentkeys=0{,0},0),0],!^F,o,O,e,=end,=elsif,=when,=ensure,=rescue,==begin,==end
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=ri
setlocal nolinebreak
setlocal nolisp
set list
setlocal list
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=rubycomplete#Complete
setlocal path=C:/RailsInstaller/Ruby1.9.2/lib/ruby/site_ruby/1.9.1,C:/RailsInstaller/Ruby1.9.2/lib/ruby/site_ruby/1.9.1/i386-msvcrt,C:/RailsInstaller/Ruby1.9.2/lib/ruby/site_ruby,C:/RailsInstaller/Ruby1.9.2/lib/ruby/vendor_ruby/1.9.1,C:/RailsInstaller/Ruby1.9.2/lib/ruby/vendor_ruby/1.9.1/i386-msvcrt,C:/RailsInstaller/Ruby1.9.2/lib/ruby/vendor_ruby,C:/RailsInstaller/Ruby1.9.2/lib/ruby/1.9.1,C:/RailsInstaller/Ruby1.9.2/lib/ruby/1.9.1/i386-mingw32,C:mydocs.vimundleCommand-T/ruby
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=.rb
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'ruby'
setlocal syntax=ruby
endif
setlocal tabstop=8
setlocal tags=C:/mydocs/Ruby/puzzlenode/.git/ruby.tags,C:/mydocs/Ruby/puzzlenode/.git/tags,./tags,tags,C:/RailsInstaller/Ruby1.9.2/lib/ruby/site_ruby/1.9.1/tags,C:/RailsInstaller/Ruby1.9.2/lib/ruby/site_ruby/1.9.1/i386-msvcrt/tags,C:/RailsInstaller/Ruby1.9.2/lib/ruby/site_ruby/tags,C:/RailsInstaller/Ruby1.9.2/lib/ruby/vendor_ruby/1.9.1/tags,C:/RailsInstaller/Ruby1.9.2/lib/ruby/vendor_ruby/1.9.1/i386-msvcrt/tags,C:/RailsInstaller/Ruby1.9.2/lib/ruby/vendor_ruby/tags,C:/RailsInstaller/Ruby1.9.2/lib/ruby/1.9.1/tags,C:/RailsInstaller/Ruby1.9.2/lib/ruby/1.9.1/i386-mingw32/tags,C:mydocs.vimundleCommand-T/ruby/tags
setlocal textwidth=79
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
argglobal
edit lib\banker.rb
nnoremap <buffer> <silent> g} :exe        "ptjump =RubyCursorIdentifier()"
nnoremap <buffer> <silent> } :exe          "ptag =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g] :exe      "stselect =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g :exe        "stjump =RubyCursorIdentifier()"
nnoremap <buffer> <silent>  :exe v:count1."stag =RubyCursorIdentifier()"
nnoremap <buffer> <silent> ] :exe v:count1."stag =RubyCursorIdentifier()"
nnoremap <buffer> <silent>  :exe  v:count1."tag =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g] :exe       "tselect =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g :exe         "tjump =RubyCursorIdentifier()"
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=RubyBalloonexpr()
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal copyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=^\\s*#\\s*define
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'ruby'
setlocal filetype=ruby
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=n1croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=^\\s*\\<\\(load\\>\\|require\\>\\|autoload\\s*:\\=[\"']\\=\\h\\w*[\"']\\=,\\)
setlocal includeexpr=substitute(substitute(v:fname,'::','/','g'),'$','.rb','')
setlocal indentexpr=GetRubyIndent(v:lnum)
setlocal indentkeys=0{,0},0),0],!^F,o,O,e,=end,=elsif,=when,=ensure,=rescue,==begin,==end
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=ri
setlocal nolinebreak
setlocal nolisp
set list
setlocal list
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=rubycomplete#Complete
setlocal path=C:/RailsInstaller/Ruby1.9.2/lib/ruby/site_ruby/1.9.1,C:/RailsInstaller/Ruby1.9.2/lib/ruby/site_ruby/1.9.1/i386-msvcrt,C:/RailsInstaller/Ruby1.9.2/lib/ruby/site_ruby,C:/RailsInstaller/Ruby1.9.2/lib/ruby/vendor_ruby/1.9.1,C:/RailsInstaller/Ruby1.9.2/lib/ruby/vendor_ruby/1.9.1/i386-msvcrt,C:/RailsInstaller/Ruby1.9.2/lib/ruby/vendor_ruby,C:/RailsInstaller/Ruby1.9.2/lib/ruby/1.9.1,C:/RailsInstaller/Ruby1.9.2/lib/ruby/1.9.1/i386-mingw32,C:mydocs.vimundleCommand-T/ruby
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=.rb
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'ruby'
setlocal syntax=ruby
endif
setlocal tabstop=8
setlocal tags=C:/mydocs/Ruby/puzzlenode/.git/ruby.tags,C:/mydocs/Ruby/puzzlenode/.git/tags,./tags,tags,C:/RailsInstaller/Ruby1.9.2/lib/ruby/site_ruby/1.9.1/tags,C:/RailsInstaller/Ruby1.9.2/lib/ruby/site_ruby/1.9.1/i386-msvcrt/tags,C:/RailsInstaller/Ruby1.9.2/lib/ruby/site_ruby/tags,C:/RailsInstaller/Ruby1.9.2/lib/ruby/vendor_ruby/1.9.1/tags,C:/RailsInstaller/Ruby1.9.2/lib/ruby/vendor_ruby/1.9.1/i386-msvcrt/tags,C:/RailsInstaller/Ruby1.9.2/lib/ruby/vendor_ruby/tags,C:/RailsInstaller/Ruby1.9.2/lib/ruby/1.9.1/tags,C:/RailsInstaller/Ruby1.9.2/lib/ruby/1.9.1/i386-mingw32/tags,C:mydocs.vimundleCommand-T/ruby/tags
setlocal textwidth=79
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 31 - ((30 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
31
normal! 063l
wincmd w
argglobal
edit files\SAMPLE_RATES.xml
noremap <buffer> <silent> [" :call search('\%(^\s*<!--.*\n\)\%(^\s*-->\)\@!', "bW")
noremap <buffer> <silent> ]" :call search('^\(\s*<!--.*\n\)\@<!\(\s*-->\)', "W")
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=<!--%s-->
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal copyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'xml'
setlocal filetype=xml
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=qrn1
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=XmlIndentGet(v:lnum,1)
setlocal indentkeys=o,O,*<Return>,<>>,<<>,/,{,}
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,58
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
set list
setlocal list
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal smartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'xml'
setlocal syntax=xml
endif
setlocal tabstop=8
setlocal tags=C:/mydocs/Ruby/puzzlenode/.git/xml.tags,C:/mydocs/Ruby/puzzlenode/.git/tags,./tags,tags
setlocal textwidth=79
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 12) / 24)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
argglobal
edit files\SAMPLE_TRANS.csv
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal copyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != ''
setlocal filetype=
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=qrn1
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
set list
setlocal list
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal smartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != ''
setlocal syntax=
endif
setlocal tabstop=8
setlocal tags=C:/mydocs/Ruby/puzzlenode/.git/tags,./tags,tags
setlocal textwidth=79
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 11) / 23)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 02l
wincmd w
exe 'vert 1resize ' . ((&columns * 68 + 103) / 206)
exe 'vert 2resize ' . ((&columns * 96 + 103) / 206)
exe '3resize ' . ((&lines * 24 + 25) / 50)
exe 'vert 3resize ' . ((&columns * 40 + 103) / 206)
exe '4resize ' . ((&lines * 23 + 25) / 50)
exe 'vert 4resize ' . ((&columns * 40 + 103) / 206)
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :

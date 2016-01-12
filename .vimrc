"      ___                       ___           ___           ___
"     /\__\          ___        /\__\         /\  \         /\  \
"    /:/  /         /\  \      /::|  |       /::\  \       /::\  \
"   /:/  /          \:\  \    /:|:|  |      /:/\:\  \     /:/\:\  \
"  /:/__/  ___      /::\__\  /:/|:|__|__   /::\~\:\  \   /:/  \:\  \
"  |:|  | /\__\  __/:/\/__/ /:/ |::::\__\ /:/\:\ \:\__\ /:/__/ \:\__\
"  |:|  |/:/  / /\/:/  /    \/__/~~/:/  / \/_|::\/:/  / \:\  \  \/__/
"  |:|__/:/  /  \::/__/           /:/  /     |:|::/  /   \:\  \
"   \::::/__/    \:\__\          /:/  /      |:|\/__/     \:\  \
"    ~~~~         \/__/         /:/  /       |:|  |        \:\__\
"
" README:
" Copyright (c) 2015 dogyearm (yutaro iwamoto) All Rights Reserved
"
" dogyearm
" GitHub -> https://github.com/dogyearm
"

"-------------------------------------------------------------------------------
" NeoBundleSetting
"-------------------------------------------------------------------------------
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tpope/vim-endwise.git'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'jQuery'
NeoBundle 'nginx.vim'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'fatih/vim-go'
NeoBundle 'Smooth-Scroll'
NeoBundle 'scrooloose/nerdcommenter.git'
NeoBundle 'xmledit'
NeoBundle 'Align'
NeoBundle 'godlygeek/tabular'
NeoBundle 'Gundo'
NeoBundle 'tpope/vim-surround'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'yuroyoro/vim-autoclose'
NeoBundle 'smartword'
NeoBundle 'camelcasemotion'
NeoBundle 'SQLUtilities'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'mattn/hahhah-vim'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'banyan/recognize_charcode.vim'
" DumbBuf.vim : quickbufっぽくbufferを管理。 "<Leader>b<Space>でBufferList
NeoBundle 'DumbBuf'
" タブエディタ風にバッファ管理ウィンドウを表示
NeoBundle 'fholgado/minibufexpl.vim'

" エラーがある場所をhilight
NeoBundle 'errormarker.vim'

" }}}
call neobundle#end()

"-------------------------------------------------------------------------------
" solarized
"-------------------------------------------------------------------------------
syntax enable
set background=dark
colorscheme solarized

"-------------------------------------------------------------------------------
" unite.vim
"-------------------------------------------------------------------------------
let g:unite_enable_start_insert = 1
let g:unite_enable_split_vertically = 0
let g:unite_winwidth = 40
let g:unite_source_file_mru_long_limit = 100
call unite#custom_source('file_rec', 'ignore_pattern', 'vendor/\|tmp/\|log/')
call unite#custom_source('file_rec/git', 'ignore_pattern', 'vendor/\|tmp/\|log/') " バッファ一覧
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
nnoremap <silent> ,ut :<C-u>Unite -buffer-name=files buffer file_mru file_rec/async file/new  <CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru <CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> ,ug :<C-u>Unite grep/git:. -no-quit<CR>
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
" Rails Key bind
nnoremap <silent> ,urc :<C-u>Unite file_rec:app/controllers/ -input=!admin<CR><Space>
nnoremap <silent> ,urfc :<C-u>Unite file file/new -input=app/controllers/ <CR>
nnoremap <silent> ,urm :<C-u>Unite file_rec:app/models/ -input=!admin <CR><Space>
nnoremap <silent> ,urfm :<C-u>Unite file file/new -input=app/models/ <CR>
nnoremap <silent> ,urma :<C-u>Unite file_rec:app/mailers/ -input=!admin <CR><Space>
nnoremap <silent> ,urfma :<C-u>Unite file file/new -input=app/mailers/ <CR>
nnoremap <silent> ,urd :<C-u>Unite file_rec:db/ -input=!admin <CR><Space>
nnoremap <silent> ,urfd :<C-u>Unite file file/new -input=db/ <CR>
nnoremap <silent> ,urv :<C-u>Unite file_rec:app/views/ -input=!admin <CR><Space>
nnoremap <silent> ,urfv :<C-u>Unite file file/new -input=app/views/ <CR>
nnoremap <silent> ,urs :<C-u>Unite file_rec:app/assets/stylesheets/ <CR>
nnoremap <silent> ,urfs :<C-u>Unite file file/new -input=app/assets/stylesheets/ <CR>
nnoremap <silent> ,urj :<C-u>Unite file_rec:app/assets/javascripts/ <CR>
nnoremap <silent> ,urfj :<C-u>Unite file file/new -input=app/assets/javascripts/ <CR>
nnoremap <silent> ,uro :<C-u>Unite file_rec:config/ <CR>
nnoremap <silent> ,urfo :<C-u>Unite file file/new -input=config/ <CR>
nnoremap <silent> ,url :<C-u>Unite file_rec:lib/ <CR>
nnoremap <silent> ,urfl :<C-u>Unite file file/new -input=lib/ <CR>
nnoremap <silent> ,urr :<C-u>Unite file_rec:spec/ <CR>
nnoremap <silent> ,urfr :<C-u>Unite file file/new -input=spec/ <CR>
nnoremap <silent> ,urt :<C-u>Unite file_rec:app/tasks/ <CR>
nnoremap <silent> ,urft :<C-u>Unite file file/new -input=app/tasks/ <CR>
nnoremap <silent> ,ura :<C-u>Unite file_rec:app/apis/ <CR>
nnoremap <silent> ,urfa :<C-u>Unite file file/new -input=app/apis/ <CR>
nnoremap <silent> ,uru :<C-u>Unite file_rec:app/utils/ <CR>
nnoremap <silent> ,urfu :<C-u>Unite file file/new -input=app/utils/ <CR>
nnoremap <silent> ,urh :<C-u>Unite file_rec:chef/ <CR>
nnoremap <silent> ,urfh :<C-u>Unite file file/new -input=chef/ <CR>
" Hugo Key bind
" Wordpress Key bind

"------------------------------------
" smooth_scroll.vim
"------------------------------------
map  :call SmoothScroll("d",1, 1)<CR>
map  :call SmoothScroll("u",1, 1)<CR>

"------------------------------------
" errormarker.vim
"------------------------------------
" disable default shortcut mapping and re-define to <Leader>ec
let g:errormarker_disablemappings = 1
nmap <silent> <unique> <Leader>ec :ErrorAtCursor<CR>

"-------------------------------------------------------------------------------
" 基本設定 Basics
"-------------------------------------------------------------------------------
let mapleader = ","              " キーマップリーダー
set scrolloff=5                  " スクロール時の余白確保
set textwidth=0                  " 一行に長い文章を書いていても自動折り返しをしない
set nobackup                     " バックアップ取らない
set autoread                     " 他で書き換えられたら自動で読み直す
set noswapfile                   " スワップファイル作らない
set hidden                       " 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start   " バックスペースでなんでも消せるように
set formatoptions=lmoq           " テキスト整形オプション，マルチバイト系を追加
set vb t_vb=                     " ビープをならさない
set browsedir=buffer             " Exploreの初期ディレクトリ
set whichwrap=b,s,h,l,<,>,[,]    " カーソルを行頭、行末で止まらないようにする
set showcmd                      " コマンドをステータス行に表示
set showmode                     " 現在のモードを表示
set viminfo='50,<1000,s100,\"50  " viminfoファイルの設定
set modelines=0                  " モードラインは無効
set notitle                      " vimを使ってくれてありがとう
" OSのクリップボードを使用する
set clipboard+=unnamed
" ターミナルでマウスを使用できるようにする
set mouse=a
set guioptions+=a
set ttymouse=xterm2
"ヤンクした文字は、システムのクリップボードに入れる"
set clipboard=unnamed
" 挿入モードでCtrl+kを押すとクリップボードの内容を貼り付けられるようにする "
imap <C-p>  <ESC>"*pa
" Ev/Rvでvimrcの編集と反映
command! Ev edit $MYVIMRC
command! Rv source $MYVIMRC
set helpfile=$VIMRUNTIME/doc/help.txt
" Some Linux distributions set filetype in /etc/vimrc.
"   " Clear filetype flags before changing runtimepath to force Vim to
"   reload them.
if exists("g:did_load_filetypes")
  filetype off
  filetype plugin indent off
endif
" GoLangのpluginをruntime pathへ
let goroot = substitute(system("go env GOROOT"),  '\n$',  '',  '')
" ファイルタイプ判定をon
filetype plugin on

"-------------------------------------------------------------------------------
" 表示 Apperance
"-------------------------------------------------------------------------------
set showmatch         " 括弧の対応をハイライト
set number            " 行番号表示
set list              " 不可視文字表示
set listchars=tab:>.,trail:_,extends:>,precedes:< " 不可視文字の表示形式
set display=uhex      " 印字不可能文字を16進数で表示

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" カーソル行をハイライト
" set cursorline
" hi clear CursorLine
" hi CursorLine gui=underline
" highlight CursorLine ctermbg=black guibg=black


"-------------------------------------------------------------------------------
" エンコーディング関連 Encoding
"-------------------------------------------------------------------------------
set ffs=unix,dos,mac  " 改行文字
set encoding=utf-8    " デフォルトエンコーディング

" 文字コード認識はbanyan/recognize_charcode.vimへ

" cvsの時は文字コードをeuc-jpに設定
autocmd FileType cvs :set fileencoding=euc-jp
" 以下のファイルの時は文字コードをutf-8に設定
autocmd FileType svn :set fileencoding=utf-8
autocmd FileType js :set fileencoding=utf-8
autocmd FileType css :set fileencoding=utf-8
autocmd FileType html :set fileencoding=utf-8
autocmd FileType xml :set fileencoding=utf-8
autocmd FileType java :set fileencoding=utf-8
autocmd FileType scala :set fileencoding=utf-8

" ワイルドカードで表示するときに優先度を低くする拡張子
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" 指定文字コードで強制的にファイルを開く
command! Cp932 edit ++enc=cp932
command! Eucjp edit ++enc=euc-jp
command! Iso2022jp edit ++enc=iso-2022-jp
command! Utf8 edit ++enc=utf-8
command! Jis Iso2022jp
command! Sjis Cp932

"-------------------------------------------------------------------------------
" インデント Indent
"-------------------------------------------------------------------------------
set autoindent   " 自動でインデント
"set paste        " ペースト時にautoindentを無効に(onにするとautocomplpop.vimが動かない)
set smartindent  " 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。
set cindent      " Cプログラムファイルの自動インデントを始める

" softtabstopはTabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
set tabstop=2 shiftwidth=2 softtabstop=0

if has("autocmd")
  "ファイルタイプの検索を有効にする
  filetype plugin on
  "そのファイルタイプにあわせたインデントを利用する
  filetype indent on
  " これらのftではインデントを無効に
  "autocmd FileType php filetype indent off

  autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType aspvbs     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType eruby      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType jsx        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vb         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType wsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType go         setlocal noexpandtab list tabstop=2 shiftwidth=2
endif

"-------------------------------------------------------------------------------
" 編集関連 Edit
"-------------------------------------------------------------------------------
" insertモードを抜けるとIMEオフ
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" yeでそのカーソル位置にある単語をレジスタに追加
nmap ye ;let @"=expand("<cword>")<CR>
" Visualモードでのpで選択範囲をレジスタの内容に置き換える
" vnoremap p <Esc>;let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Tabキーを空白に変換
set expandtab

" コンマの後に自動的にスペースを挿入
inoremap , ,<Space>
" XMLの閉タグを自動挿入
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
augroup END

"  Insert mode中で単語単位/行単位の削除をアンドゥ可能にする
inoremap <C-u>  <C-g>u<C-u>
inoremap <C-w>  <C-g>u<C-w>

" :Ptでインデントモード切替
command! Pt :set paste!

" インサートモード中に<C-o>でyankした内容をputする
inoremap <C-o> <ESC>:<C-U>YRPaste 'p'<CR>i

" y9 ydで行末までヤンク
nmap y9 y$
nmap yd y$
" y0 ykで行頭までヤンク
nmap y0 y^
nmap yk y^
" カーソルから行頭まで削除
nnoremap <silent> <C-d> d0
" カーソルから行頭まで削除(インサートモード)
inoremap <silent> <C-k> <Esc>lc^
" カーソルから行末まで削除(インサートモード)
inoremap <silent> <C-d> <Esc>lc$
" カーソルから行頭までヤンク(インサートモード)
inoremap <silent> <C-y>e <Esc>ly0<Insert>
" カーソルから行末までヤンク(インサートモード)
inoremap <silent> <C-y>0 <Esc>ly$<Insert>

" 括弧を自動補完
"inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
"vnoremap { "zdi^V{<C-R>z}<ESC>
"vnoremap [ "zdi^V[<C-R>z]<ESC>
"vnoremap ( "zdi^V(<C-R>z)<ESC>
"vnoremap " "zdi^V"<C-R>z^V"<ESC>
"vnoremap ' "zdi'<C-R>z'<ESC>

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にtabをスペースに変換する
autocmd BufWritePre * :%s/\t/  /ge

" 日時の自動入力
inoremap <expr> ,df strftime('%Y/%m/%d %H:%M:%S')
inoremap <expr> ,dd strftime('%Y/%m/%d')
inoremap <expr> ,dt strftime('%H:%M:%S')

" foldは各FiltTypeにお任せる
" set foldmethod=syntax
" 折りたたみは全て展開した状態で開始する
" set foldlevelstart=99
" .vimはmarker
" autocmd FileType vim :set foldmethod=marker

" <leader>j でJSONをformat
" http://wozozo.hatenablog.com/entry/2012/02/08/121504
map <Leader>j !python -m json.tool<CR>

" quickfixウィンドウではq/ESCで閉じる
autocmd FileType qf nnoremap <buffer> q :ccl<CR>
autocmd FileType qf nnoremap <buffer> <ESC> :ccl<CR>

" cwでquickfixウィンドウの表示をtoggleするようにした
function! s:toggle_qf_window()
  for bufnr in range(1,  winnr('$'))
    if getwinvar(bufnr,  '&buftype') ==# 'quickfix'
      execute 'ccl'
      return
    endif
  endfor
  execute 'botright cw'
endfunction
nnoremap <silent> cw :call <SID>toggle_qf_window()<CR>

" Font
set guifont=menlo:h11


"-------------------------------------------------------------------------------
" ステータスライン StatusLine
"-------------------------------------------------------------------------------
set laststatus=2 " 常にステータスラインを表示

"カーソルが何行目の何列目に置かれているかを表示する
set ruler

" vim-powerlineでフォントにパッチを当てないなら以下をコメントアウト
let g:Powerline_symbols = 'fancy'

"ステータスラインに文字コードと改行文字を表示する
" if winwidth(0) >= 120
"   set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %{g:HahHah()}\ %F%=[%{GetB()}]\ %{fugitive#statusline()}\ %l,%c%V%8P
" else
"   set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %{g:HahHah()}\ %f%=[%{GetB()}]\ %{fugitive#statusline()}\ %l,%c%V%8P
" endif

"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340 ctermfg=cyan
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90 ctermfg=white
augroup END

"自動的に QuickFix リストを表示する
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep,vimgrepadd cwin
autocmd QuickfixCmdPost lmake,lgrep,lgrepadd,lvimgrep,lvimgrepadd lwin

function! GetB()
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return String2Hex(c)
endfunction
" help eval-examples
" The function Nr2Hex() returns the Hex string of a number.
func! Nr2Hex(nr)
  let n = a:nr
  let r = ""
  while n
    let r = '0123456789ABCDEF'[n % 16] . r
    let n = n / 16
  endwhile
  return r
endfunc
" The function String2Hex() converts each character in a string to a two
" character Hex string.
func! String2Hex(str)
  let out = ''
  let ix = 0
  while ix < strlen(a:str)
    let out = out . Nr2Hex(char2nr(a:str[ix]))
    let ix = ix + 1
  endwhile
  return out
endfunc

" vimrc簡単編集
nnoremap <silent> ,, :edit ~/.vimrc<CR>

" Insertモードのときカーソルの形状を変更
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
inoremap <Esc> <Esc>

" US keyboard
nnoremap ; :
nnoremap : ;

"------------------------------------
"" MiniBufExplorer
"------------------------------------
""set minibfexp
let g:miniBufExplMapWindowNavVim=1 "hjklで移動
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1
let g:miniBufExplSplitToEdge=1
nnoremap <silent> <S-h> :bprev <CR>
nnoremap <silent> <S-l> :bnext <CR>

"-------------------------------------------------------------------------------
" vim-plug
"-------------------------------------------------------------------------------
" Install
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" general
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/unite.vim'

" highlight
Plug 'vim-ruby/vim-ruby'
Plug 'fatih/vim-go'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'tomlion/vim-solidity'
Plug 'posva/vim-vue'
Plug 'leafgarland/typescript-vim'

" theme
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/seoul256.vim'
Plug 'nanotech/jellybeans.vim'

" etc
Plug 'fholgado/minibufexpl.vim'
Plug 'airblade/vim-gitgutter'
" Plug 'neoclide/coc.nvim' " vimがIDEになってしまうプラグイン。
" Plug 'junegunn/vim-easy-align'

call plug#end()

"-------------------------------------------------------------------------------
" solarized.vim
"-------------------------------------------------------------------------------
set background=dark
syntax enable
colorscheme solarized

"-------------------------------------------------------------------------------
" fzf.vim
"-------------------------------------------------------------------------------
" If installed using git
set rtp+=~/.fzf

let $FZF_DEFAULT_OPTS="--layout=reverse"
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }

let mapleader = "\<Space>"

" fzf
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>g :GFiles<CR>
nnoremap <silent> <leader>G :GFiles?<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>h :History<CR>
nnoremap <silent> <leader>r :Rg<CR>

"-------------------------------------------------------------------------------
" unite.vim
"-------------------------------------------------------------------------------
let g:unite_enable_start_insert = 1
let g:unite_enable_split_vertically = 0
let g:unite_winwidth = 40
let g:unite_source_rec_min_cache_files = 100
let g:unite_source_rec_max_cache_files = 5000
let g:unite_source_file_mru_long_limit = 6000
let g:unite_source_file_mru_limit = 300
let g:unite_source_directory_mru_long_limit = 6000
call unite#custom_source('file_rec', 'ignore_pattern', 'vendor/\|tmp/\|log/')
call unite#custom_source('file_rec/git', 'ignore_pattern', 'vendor/\|tmp/\|log/') " バッファ一覧

nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
nnoremap <silent> ,ut :<C-u>Unite -buffer-name=files buffer file_mru file_rec/async file/new  <CR>
nnoremap <silent> ,um :<C-u>Unite file_mru <CR>
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> ,ug :<C-u>Unite grep/git:. -no-quit<CR>
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
set redrawtime=10000
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
nnoremap <silent> ,urs :<C-u>Unite file_rec:frontend/src/stylesheets/ <CR>
nnoremap <silent> ,urfs :<C-u>Unite file file/new -input=frontend/src/stylesheets/ <CR>
nnoremap <silent> ,urj :<C-u>Unite file_rec: <CR>
nnoremap <silent> ,urfj :<C-u>Unite file file/new -input= <CR>
nnoremap <silent> ,uro :<C-u>Unite file_rec:config/ <CR>
nnoremap <silent> ,urfo :<C-u>Unite file file/new -input=config/ <CR>
nnoremap <silent> ,url :<C-u>Unite file_rec:lib/ <CR>
nnoremap <silent> ,urfl :<C-u>Unite file file/new -input=lib/ <CR>
nnoremap <silent> ,urr :<C-u>Unite file_rec:spec/ <CR>
nnoremap <silent> ,urfr :<C-u>Unite file file/new -input=spec/ <CR>
nnoremap <silent> ,urt :<C-u>Unite file_rec:app/tasks/ <CR>
nnoremap <silent> ,urfre :<C-u>Unite file file/new -input=app/repositories/ <CR>
nnoremap <silent> ,urre :<C-u>Unite file_rec:app/repositories/ <CR>
nnoremap <silent> ,urfse :<C-u>Unite file file/new -input=app/services/ <CR>
nnoremap <silent> ,urse :<C-u>Unite file_rec:app/services/ <CR>
nnoremap <silent> ,urft :<C-u>Unite file file/new -input=app/tasks/ <CR>
nnoremap <silent> ,uru :<C-u>Unite file_rec:app/utils/ <CR>
nnoremap <silent> ,urfu :<C-u>Unite file file/new -input=app/utils/ <CR>
nnoremap <silent> ,urva :<C-u>Unite file_rec:app/validators/ -input=!admin<CR><Space>
nnoremap <silent> ,urfva :<C-u>Unite file file/new -input=app/validators/ <CR>
nnoremap <silent> ,ura :<C-u>Unite file_rec:app/apis/ -input=!admin<CR><Space>
nnoremap <silent> ,urfa :<C-u>Unite file file/new -input=app/apis/ <CR>
noremap <silent> ,urn :<C-u>Unite file_rec:frontend/src/ -input=!admin<CR><Space>
nnoremap <silent> ,urfn :<C-u>Unite file file/new -input=frontend/src/ <CR>

"------------------------------------
"" MiniBufExplorer
"------------------------------------
""set minibfexp
let g:miniBufExplMapWindowNavVim=1 "hjklで移動
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1
let g:miniBufExplSplitToEdge=1
let g:dumbbuf_hotkey='b,'
nnoremap <silent> <S-h> :bprev <CR>
nnoremap <silent> <S-l> :bnext <CR>

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
set ttimeoutlen=10               " キーコードシーケンスが終了するのを待つ時間を短くする

nnoremap <silent> ,, :call<SID>editRc()<CR>
nnoremap <silent> .. :call<SID>loadRc()<CR>
nnoremap ; :
set clipboard+=unnamed

function! s:editRc()
  execute ":e ".$MYVIMRC
  execute ":e ~/.zshrc"
  execute ":e ~/todo/".strftime('%Y%m%d').".md"
endfunction

function! s:loadRc()
  execute ":source ".$MYVIMRC
  execute ":source ~/.zshrc"
endfunction

"-------------------------------------------------------------------------------
" 表示 Apperance
"-------------------------------------------------------------------------------
set showmatch                                       " 括弧の対応をハイライト
set number                                          " 行番号表示
set list                                            " 不可視文字表示
set listchars=tab:>.,trail:_,extends:>,precedes:<   " 不可視文字の表示形式
set display=uhex                                    " 印字不可能文字を16進数で表示
set laststatus=2                                    " 常にステータスラインを表示
set ruler                                           " カーソルが何行目の何列目に置かれているかを表示する
set guifont=menlo:h9                                " Font指定

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" カーソルの形状
if has('vim_starting')
  " 挿入モード時に非点滅の縦棒タイプのカーソル
  let &t_SI .= "\e[6 q"
  " ノーマルモード時に非点滅のブロックタイプのカーソル
  let &t_EI .= "\e[2 q"
  " 置換モード時に非点滅の下線タイプのカーソル
  let &t_SR .= "\e[4 q"
endif

"-------------------------------------------------------------------------------
" エンコーディング関連 Encoding
"-------------------------------------------------------------------------------
set ffs=unix,dos,mac              " 改行文字
set encoding=utf-8                " デフォルトエンコーディング

" 文字コード認識はへ
autocmd FileType cvs   :set fileencoding=euc-jp
autocmd FileType svn   :set fileencoding=utf-8
autocmd FileType js    :set fileencoding=utf-8
autocmd FileType css   :set fileencoding=utf-8
autocmd FileType html  :set fileencoding=utf-8
autocmd FileType xml   :set fileencoding=utf-8
autocmd FileType xml   :set fileencoding=shift-jis
autocmd FileType java  :set fileencoding=utf-8
autocmd FileType scala :set fileencoding=utf-8
autocmd BufNewFile,BufRead *.vue set filetype=html " vueファイルをhtmlとして認識させる
autocmd BufNewFile,BufRead *.rules set filetype=js " firestore.rulesファイルをjsとして認識させる

"-------------------------------------------------------------------------------
" インデント Indent
"-------------------------------------------------------------------------------
set autoindent                    " 自動でインデント
set paste                         " ペースト時にautoindentを無効に(onにするとautocomplpop.vimが動かない)
set smartindent                   " 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。
set cindent                       " Cプログラムファイルの自動インデントを始める
set tabstop=2 shiftwidth=2 softtabstop=0

if has("autocmd")
  filetype plugin on
  filetype indent on
  autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType aspvbs     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType eruby      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType erb        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType jsx        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=2 sts=2 ts=2 et
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
set expandtab                       " Tabキーを空白に変換
set hlsearch                        " 検索語句のハイライ
autocmd BufWritePre * :%s/\t/  /ge  " 保存時にtabをスペースに変換する

" 括弧を自動補完
" inoremap { {}<LEFT>
" inoremap [ []<LEFT>
" inoremap ( ()<LEFT>
" inoremap " ""<LEFT>
" inoremap ' ''<LEFT>
" vnoremap { "zdi^V{<C-R>z}<ESC>
" vnoremap [ "zdi^V[<C-R>z]<ESC>
" vnoremap ( "zdi^V(<C-R>z)<ESC>
" vnoremap " "zdi^V"<C-R>z^V"<ESC>
" vnoremap ' "zdi'<C-R>z'<ESC>

"------------------------------------
"" vimrc.local
"------------------------------------
if ! filereadable(expand('~/.vimrc.local'))
  call writefile(['" Local setting'], $HOME."/.vimrc.local")
endif
source ~/.vimrc.local


"-------------------------------------------------------------------------------
" Method
"-------------------------------------------------------------------------------

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
Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release/rpc' }

" highlight
Plug 'vim-ruby/vim-ruby'
Plug 'fatih/vim-go'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'tomlion/vim-solidity'
Plug 'posva/vim-vue'
Plug 'leafgarland/typescript-vim'
Plug 'godlygeek/tabular'

" theme
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/seoul256.vim'
Plug 'nanotech/jellybeans.vim'

" etc
Plug 'airblade/vim-gitgutter'

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

let $EZF_DEFAULT_OPTS="--layout=reverse"
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']

" Empty value to disable preview window altogether
let g:fzf_preview_window = []
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }

let mapleader = "\<Space>"

" fzf
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>g :GFiles<CR>
nnoremap <silent> <leader>G :GFiles?<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>h :History<CR>
nnoremap <silent> <leader>r :Rg<CR>

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

let g:fzf_action = {
  \ 'ctrl-o': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

"------------------------------------
"" MiniBufExplorer
"------------------------------------
""set minibfexp
" let g:miniBufExplMapWindowNavVim=1 "hjklで移動
" let g:miniBufExplMapWindowNavArrows=1
" let g:miniBufExplMapCTabSwitchBufs=1
" let g:miniBufExplModSelTarget=1
" let g:miniBufExplSplitToEdge=1
" let g:dumbbuf_hotkey='b,'
" nnoremap <silent> <S-h> :bprev <CR>
" nnoremap <silent> <S-l> :bnext <CR>

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
nnoremap <silent> .. :source $MYVIMRC<CR>

nnoremap ; :
set clipboard+=unnamed

function! s:editRc()
  execute ":e ".$MYVIMRC
  execute ":e ~/.zshrc"
  execute ":e ~/.tmux.conf"
  execute ":e ~/memo/dist/".strftime('%Y%m%d').".md"
  execute ":cd ~/memo"
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
" markdownのハイライトを有効にする
set syntax=markdown
au BufRead,BufNewFile *.md set filetype=markdown

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
autocmd BufWritePre * :%s/\s\+$//e  " 保存時に行末のスペースを削除する

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

" ウィンドウ分割を楽にする設定
nnoremap <silent> s- :<C-u>sp<CR>
nnoremap <silent> s| :<C-u>vs<CR>
nnoremap <silent> sq :<C-u>q<CR>
nnoremap <silent> sQ :<C-u>bd<CR>
nnoremap <silent> sj <C-w>j
nnoremap <silent> sk <C-w>k
nnoremap <silent> sl <C-w>l
nnoremap <silent> sh <C-w>h
nnoremap <silent> sJ <C-w>J
nnoremap <silent> sK <C-w>K
nnoremap <silent> sL <C-w>L
nnoremap <silent> sH <C-w>H
nnoremap <silent> s><C-w>>
nnoremap <silent> s<<C-w><
nnoremap <silent> s+<C-w>+
"nnoremap <silent> s-<C-w>-
nnoremap <silent> <C-j> <C-w>+
" nnoremap <silent> <S-j> <C-w>-

" nnoremap <silent> <S-h> :bprev <CR>
" nnoremap <silent> <S-l> :bnext <CR>



"タブ操作
nnoremap <silent> st :<C-u>tabnew<CR>
nnoremap <silent> sn gt
nnoremap <silent> sp gT

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

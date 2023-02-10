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
nnoremap <silent> ,, :edit $MYVIMRC<CR>
nnoremap <silent> .. :source $MYVIMRC<CR>
nnoremap ; :
set clipboard+=unnamed
set showmatch                                       " 括弧の対応をハイライト
set number                                          " 行番号表示
set list                                            " 不可視文字表示
set listchars=tab:>.,trail:_,extends:>,precedes:<   " 不可視文字の表示形式
set display=uhex                                    " 印字不可能文字を16進数で表示
set laststatus=2                                    " 常にステータスラインを表示
set ruler                                           " カーソルが何行目の何列目に置かれているかを表示する
set guifont=menlo:h9                                " Font指定
nnoremap <ESC> :noh<CR>                             " 検索時のハイライトを ESC で無効に
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/
if has('vim_starting')
  let &t_SI .= "\e[6 q" " 挿入モード時に非点滅の縦棒タイプのカーソル
  let &t_EI .= "\e[2 q" " ノーマルモード時に非点滅のブロックタイプのカーソル
  let &t_SR .= "\e[4 q" " 置換モード時に非点滅の下線タイプのカーソル
endif

" Encoding
set ffs=unix,dos,mac              " 改行文字
set encoding=utf-8                " デフォルトエンコーディング
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
set syntax=markdown
au BufRead,BufNewFile *.md set filetype=markdown

" Indent
set autoindent                    " 自動でインデント
set smartindent                   " 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。
set cindent                       " Cプログラムファイルの自動インデントを始める
set paste                         " ペースト時にautoindentを無効に(onにするとautocomplpop.vimが動かない)
autocmd InsertLeave * set nopaste " Turn off paste mode when leaving insert
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

" Edit ---------------------------------------------------------
set expandtab                       " Tabキーを空白に変換
set hlsearch                        " 検索語句のハイライ
autocmd BufWritePre * :%s/\t/  /ge  " 保存時にtabをスペースに変換する
autocmd BufWritePre * :%s/\s\+$//e  " 保存時に行末のスペースを削除する
nnoremap <silent> <S-h> :bprev <CR>
nnoremap <silent> <S-l> :bnext <CR>

" vim-plug
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release/rpc' }
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
call plug#end()

set background=dark
syntax enable
colorscheme solarized

nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>g :GFiles<CR>
nnoremap <silent> <leader>G :GFiles?<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>h :History<CR>
nnoremap <silent> <leader>c :Commits<CR>
nnoremap <silent> <leader>l :Lines<CR>
nnoremap <silent> <leader>r :Rg<CR>

" Rails keymap
" noremap <silent> <leader>uu :Files<CR>
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')

" noremap <silent> <leader>uu :<C-u>Files controllers<CR>

command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, <bang>0)
command! -bang -nargs=* GGrep
      \ call fzf#vim#grep(
      \   'git grep --line-number -- '.shellescape(<q-args>), 0,
      \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

let g:airline#extensions#tabline#enabled = 1

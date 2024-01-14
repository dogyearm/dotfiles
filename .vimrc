let mapleader = ","                                 " キーマップリーダー
let &t_SI .= "\e[6 q"                               " 挿入モード時に非点滅の縦棒タイプのカーソル
let &t_EI .= "\e[2 q"                               " ノーマルモード時に非点滅のブロックタイプのカーソル
let &t_SR .= "\e[4 q"                               " 置換モード時に非点滅の下線タイプのカーソル
set scrolloff=5                                     " スクロール時の余白確保
set textwidth=0                                     " 一行に長い文章を書いていても自動折り返しをしない
set nobackup                                        " バックアップ取らない
set autoread                                        " 他で書き換えられたら自動で読み直す
set noswapfile                                      " スワップファイル作らない
set hidden                                          " 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start                      " バックスペースでなんでも消せるように
set formatoptions=lmoq                              " テキスト整形オプション，マルチバイト系を追加
set vb t_vb=                                        " ビープをならさない
set browsedir=buffer                                " Exploreの初期ディレクトリ
set whichwrap=b,s,h,l,<,>,[,]                       " カーソルを行頭、行末で止まらないようにする
set showcmd                                         " コマンドをステータス行に表示
set showmode                                        " 現在のモードを表示
set viminfo='50,<1000,s100,\"50                     " viminfoファイルの設定
set modelines=0                                     " モードラインは無効
set notitle                                         " vimを使ってくれてありがとう
set ttimeoutlen=10                                  " キーコードシーケンスが終了するのを待つ時間を短くする
set clipboard+=unnamed
set showmatch                                       " 括弧の対応をハイライト
set number                                          " 行番号表示
set list                                            " 不可視文字表示
set listchars=tab:>.,trail:_,extends:>,precedes:<   " 不可視文字の表示形式
set display=uhex                                    " 印字不可能文字を16進数で表示
set laststatus=2                                    " 常にステータスラインを表示
set ruler                                           " カーソルが何行目の何列目に置かれているかを表示する
set guifont=menlo:h12                               " Font指定
set expandtab                                       " Tabキーを空白に変換
set hlsearch                                        " 検索語句のハイライ
autocmd BufWritePre * :%s/\t/  /ge                  " 保存時にtabをスペースに変換する
autocmd BufWritePre * :%s/\s\+$//e                  " 保存時に行末のスペースを削除する
nnoremap <ESC><ESC> :nohl<CR>                       " 検索時のハイライトを ESC で無効に
nnoremap ; :
nnoremap <silent> ,, :edit $MYVIMRC<CR>
nnoremap <silent> .. :source $MYVIMRC<CR>
nnoremap <silent> <S-h> :bprev <CR>
nnoremap <silent> <S-l> :bnext <CR>
nnoremap <silent> <S-j> :bprev <CR>
nnoremap <silent> <S-k> :bnext <CR>
nnoremap <silent> <C-h> :bprev <CR>
nnoremap <silent> <C-l> :bnext <CR>
nnoremap <silent> <C-j> :bprev <CR>
nnoremap <silent> <C-k> :bnext <CR>

" Encoding
set ffs=unix,dos,mac
set encoding=utf-8
autocmd FileType cvs   :set fileencoding=euc-jp
autocmd FileType svn   :set fileencoding=utf-8
autocmd FileType js    :set fileencoding=utf-8
autocmd FileType css   :set fileencoding=utf-8
autocmd FileType html  :set fileencoding=utf-8
autocmd FileType xml   :set fileencoding=utf-8
autocmd FileType xml   :set fileencoding=shift-jis
autocmd FileType java  :set fileencoding=utf-8
autocmd FileType scala :set fileencoding=utf-8
autocmd BufNewFile,BufRead *.vue set filetype=html
autocmd BufNewFile,BufRead *.rules set filetype=js

" Indent
set autoindent                                      " 自動でインデント
set smartindent                                     " 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。
set cindent                                         " Cプログラムファイルの自動インデントを始める
set paste                                           " ペースト時にautoindentを無効に(onにするとautocomplpop.vimが動かない)
autocmd InsertLeave * set nopaste                   " Turn off paste mode when leaving insert
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
  autocmd FileType markdown   setlocal sw=2 sts=2 ts=2 et
endif

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Vim Plug
call plug#begin()
Plug 'altercation/vim-colors-solarized'             " Solarized
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy Finder
Plug 'junegunn/fzf.vim'                             " Fzf Vim Plugin
Plug 'vim-airline/vim-airline'                      " ritch status bar
Plug 'vim-airline/vim-airline-themes'               " status bar theme
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'mattn/webapi-vim'
Plug 'mattn/vim-gist'
Plug 'github/copilot.vim'
call plug#end()

colorscheme solarized
set background=dark

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_theme = 'solarized'

" fzf
nnoremap <silent> <leader>f :ProjectRoot<CR>
nnoremap <silent> <leader>g :GFiles<CR>
nnoremap <silent> <leader>G :GFiles?<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>h :History<CR>
nnoremap <silent> <leader>c :Commits<CR>
nnoremap <silent> <leader>l :Lines<CR>
nnoremap <silent> <leader>r :Rg<CR>

command! -bang ProjectRoot call fzf#vim#files('~/src/', <bang>0)
let $FZF_DEFAULT_OPTS="--layout=reverse --info=inline"
let $FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
let g:fzf_layout = { 'up': '30%' }
let g:fzf_preview_window = []

" Rails keymap
nnoremap <silent> <leader>urc :Files app/controllers/<CR>
nnoremap <silent> <leader>urm :Files app/models/<CR>
nnoremap <silent> <leader>urma :Files app/mailers/<CR>
nnoremap <silent> <leader>urd :Files db/<CR>
nnoremap <silent> <leader>urv :Files app/views/<CR>
nnoremap <silent> <leader>urs :Files app/assets/stylesheets/<CR>
nnoremap <silent> <leader>urj :Files app/javascript/<CR>
nnoremap <silent> <leader>uro :Files config/<CR>
nnoremap <silent> <leader>url :Files lib/<CR>
nnoremap <silent> <leader>urr :Files spec/<CR>
nnoremap <silent> <leader>urt :Files app/tasks/<CR>
nnoremap <silent> <leader>ura :Files app/apis/<CR>
nnoremap <silent> <leader>uru :Files app/utils/<CR>
nnoremap <silent> <leader>urse :Files app/services/<CR>
nnoremap <silent> <leader>urre :Files app/repositories/<CR>

" Fugitive
nnoremap <silent> <leader>oo :GBrowse<CR>
nnoremap <silent> <leader>oom :GBrowse master:%<CR>

" NOTE:
" - fzf auto yanc
"   - fzf.vim で directory search して
"   - 選択後に filename 入力して新規ファイル作成
" - save and git add
"   - https://engineering.mercari.com/blog/entry/mercari_codecast_1/
"   - git 操作を left pane で

" call map(sort(split(globpath(&runtimepath, 'config/*.vim'))), {->[execute('exec "so" v:val')]})

" 今日の日付をフォーマットしてファイル名を作成
function! CreateDailyNote()
    let l:filename = strftime("%Y%m%d") . ".md"
    let l:directory = "~/src/github.com/dogyearm/hoge/"  " 保存したいディレクトリのパス
    let l:filepath = l:directory . "/" . l:filename
    execute "edit " . l:filepath
endfunction

" ,,m を押すとCreateDailyNote関数を呼び出す
nnoremap ,,f :call CreateDailyNote()<CR>

cd ~/src/

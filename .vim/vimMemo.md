# シン・vim覚書

## 行末の空白を削除
### 半角
    :%s/ *$//g
### 全角
    :%s/　*$//g

## キーワードにマッチした数を表示
    :%s/hoge/&/gn

## 検索＆削除
### マッチした行を削除
    /hoge   # 検索
    :g//d   # 上記マッチした単語のある行を削除

### マッチした単語を削除
    /hoge     # 検索
    :%s///g   # 上記マッチした単語を削除除

### 重複を消してソート
    :sort u

## バッファの操作
### バッファの移動
    バッファ番号 + CTRL + ~
    :b バッファ番号

### カレントバッファの削除
    :bd

### バッファ一覧の表示
    :ls

### マップ(_vimrc)
    map <silent>    <F2>    :bp<cr>
    map <silent>    <F3>    :bn<cr>

## ファイル操作
    :E    # 開いているファイルのあるディレクトリを開く:Explore
    :e .  # 現在のディレクトリを開く

### WindowsのExplorerを起動する
    :silent ! start . # カレントディレクトで開く

### viで開いているファイルの再読み込み(更新とかリロード的な)
    :e!

## 分割した画面を移動する
### 次に移動
    <C-w>w  (Ctrl + w を2回押す)

## 文字コードを指定する
### Shift JIS でファイルを開き直す
    :edit ++enc=cp932

### UTF-8 でファイルを開き直す
    :e ++enc=utf-8

### Shift JIS でファイルを保存
    :set fenc=cp932

### UTF-8でファイルを保存
    :se fenc=utf-8

## 改行コードを指定する
### LF
    :edit ++fileformat=unix
### CRLF
    :e ++ff=dos
### CR
    :e ++ff=mac

## カーソル下のリンクを開く
### ブラウザで表示
    gx

### htmlとしてvimに展開
    gf

  参考：VimやEmacsでカーソル下のリンクを開く動作の比較 - Qiita - https://qiita.com/skkzsh/items/34c1ee2c1910e9cb746e

## 印刷
### html出力する(ブラウザで印刷する)
    :TOhtml
    :w
    :silent ! start %   # ブラウザ表示

    :TOhtml | :w | :silent ! start %  # 一括

### (カラースキームを白にしてから)html出力する
    :colorscheme Tomorrow | :TOhtml | :w | :silent ! start %

## vimrcについて
### vimrc:
Vimの共通設定を書くところ。（KaoriYa固有の起動時読込ファイル？）

### .vimrc:
Vimの個人設定を書くところ。
以下のいずれかの場所に置く。
- $HOME/.vimrc (vimを起動して:echo $HOMEで確認できる）
- $VIM/.vimrc (vimを起動して:echo $VIMで確認できる）
- \$HOMEで見つかれば、\$VIMは読まない

## プラグイン
### unite.vim
便利そうなコマンド
~~~
:Unite source       // unite-source の一覧
:Unite file         // カレントディレクトリのファイルとディレクトリ一覧
:Unite file_mru     // 最近開いたファイルの一覧
:Unite history/yank // ヤンクされたワードの一覧
:Unite buffer       // バッファの一覧
:Unite -auto-preview colorscheme  // カラースキームのプレビュー
~~~
プレビューしたい場合は
~~~
:Unite -auto-preview ほげほげ
~~~
参考: unite.vim について語る - C++でゲームプログラミング - http://d.hatena.ne.jp/osyo-manga/20130307/1362621589

### NERDTree
ファイルをtree表示してくれる
~~~
:NERDTree
~~~
ブックマークを表示する
~~~
B
~~~


## 起動時間計測
コマンドラインにて、以下のオプションでvimを起動すると、指定ファイルに対して「起動に要した時間」が出力される。
~~~
# 起動時間を計測
$ vim --startuptime /tmp/startuptime.txt

# 計測結果を確認
$ vim startuptime /tmp/startuptime.txt
~~~

※vim-kaoriyaのルートにあるデフォルトvimrc,gvimrcは、かなり重いので名前を変更したり削除したりして読み込まないようにする。
なくても問題なく動く。

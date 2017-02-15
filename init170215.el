;;
;;  [2017.02.15]
;;  init.elファイルを作成
;;
;;  - ini.elは、emacsの設定ファイルの一つ。
;;  - 通常は、~/.emacs.d フォルダの直下に配置。
;;    ※"~"は、windowsでは、環境変数"HOME"のフォルダ。通常は、"C:\Users\ogawa"にする。
;;            macでは、user/[user name]
;;  - "~"は、appの直下にある必要はなく、また、"load-path"に追加する必要もなく、emacsはアクセスできる
;;  - 他の設定ファイルは、".emacs.el", ".emcs", "init"等。いずれも、任意で作成。
;;  - 設定ファイルは、読み込まれるのは、一つだけ。最初に読み込まれるモノが優先。
;;  - 優先順位は、下記の通り
;;    1. "~/.emacs.el(.emacs.elc) 
;;    2. "~/.emacs
;;    3. "~/.emacs.d/init.el <-- ここでは、このファイルを設定ファイルとする
;;    4. "~/.emacs.d/init
;;
;; [~/.emacs.d]フォルダ構成
;;
;;  [~/.emacs.d]
;;    + [conf]      ... 設定ファイルの分割ファイル格納
;;    + [site-lisp] ... elisp ファイル格納 ※siteは、和訳で"現地"。
;;    + init.el     ... 設定ファイル 
;;

;; 初回設定として、下記を追加
;; 対応する括弧をハイライトする
(setq show-paren-delay 0)
(show-paren-mode t)

;; paren /pɚɛ́n(米国英語)/の和訳は、「括弧」 ※panenthesisの略語


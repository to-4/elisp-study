;;
;;  [2019.06.28] 
;;  elispファイルで定義済の関数・変数に色をつける
;;
;;  - "hl-defined.el"ファイルをインストールする
;;    URL:https://www.emacswiki.org/emacs/hl-defined.el
;;    上記から全文コピーして、テキストファイルに貼り付けて"hl-defined.el"の名前で保存
;;    作成したファイルをインストールフォルダ(~/.emacs.d/site-lisp等)に保存
;;    下記のコードを init.el などに追記


;; elispファイルで定義済の関数・変数に色をつける
(require 'hl-defined)
(add-hook 'emacs-lisp-mode-hook 'hdefd-highlight-mode 'APPEND)



;; 補足：
;; - add-hook 関数：hook(ひっかけるかぎ)に、処理を追加する関数
;;     (add-hook '[フック名] '[関数名] [APPEND])
;;     上記の例では、hdefd-highlight-mode を emacs-lisp-mode-hook というフックに追加
;;    


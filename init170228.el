;;
;; [2017.02.28]
;; auto-install を利用する方法
;;  
;; - auto-install について
;;   - 拡張機能の一つ
;;   - Elisp のインストールを自動化してくれる
;;   - メンテナンス者：rubikiti氏
;;   
;; 
;; - インストール方法：
;;   "https://www.emacswiki.org/emacs/auto-install.el"にアクセスし、
;;   "Download"のリンクを、右クリックし、[名前を付けてリンク先を保存] から、"~/.emacs.d/site-lisp"へ保存
;;
;; - 設定方法：
;;   - init.elに下記のコードを追加
;;     分割しているため、下記のコードを"~/.emacs.d/conf/20-auto-install.elを作成し、そこへ記載
;;     1. require関数で、auto-install.el を読み込み
;;     2. auto-install-directory 変数に、"~/.emacs.d/site-lisp/" とするよう変更
;;     3. auto-install-compatibility-setup 関数を実行し、install-elisp関数群を利用可能にする
;;        (compatibility: /kəmp`æṭəbíləṭi/ [名] 互換性
;; 
;; ------------------------------------------------------------------
;; auto-install の設定
(when (require 'auto-install nil t)
  ;; インストールディレクトリを設定 初期値は"~/.emacs.d/auto-install/"
  (setq auto-install-directory "~/.emacs.d/site-lisp")
  ;; EmacsWiki に登録されている elisp の名前を取得
  (auto-install-update-emacswiki-package-name t)
  ;; install-elisp の関数を利用可能に
  (auto-install-compatibility-setup))
;; ------------------------------------------------------------------
;;
;; - 使い方：
;;   "M-x install-elisp [RET]" とすると、Elisp のURLをきかれる
;;   URLを入力。(e.g. http://www.emacswiki.org/download/redo+.el)
;;
;;   ダウンロードが開始され、終了後は"C-c C-c"をタイプすれば、インストール完了。
;;
;;



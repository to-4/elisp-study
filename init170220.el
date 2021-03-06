;;
;; [2017.02.20]
;; init.el の内容を分割する方法
;;  
;; - 使用する拡張機能(elispファイル)は、init-loader.el。
;;
;; - init-loader.elについて
;;   - 作成者は、IMAKADO氏
;;   - 機能は、分割した設定ファイルを自動的に読み込む
;;   - CodeRepos という共有リポジトリで公開
;;
;; - init-loader の入手方法 
;;   - "http://coderepos.org/share/browser/lang/elisp/init-loader/init-loader.el"にアクセス
;;   - 最下部にある"Original Format"をクリック。DLが始まる。
;; 
;; - init-loader のインストール
;;   - 取得した"init-loader.el"を"~/.emacs.d/site-lisp"フォルダへコピー。
;;
;; - init-loader の設定方法
;;   - 下記を"init.el"へ追加
;;     (require 'init-loader)
;;     (init-loader-load "~/.emacs.d/conf")
;; 
;; - init-loader の分割設定ファイルについて
;;   - 2桁の数字から始まる設定ファイルを数字の順番に読み込む(00-setting.el, 10-perl.el)
;;   - Meadow の場合、「meadow」から始まる名前のファイルを読み込む（meadow-config.el)
;;   - CarbonEmacs の場合、「carbon-emacs」から始まる名前のファイルを読み込む (carbon-emacs-config.el)
;;   - CocoaEmacs の場合、「cocoa-emacs」から始まる名前のファイルを読み込む (cocoa-emacs-config.el)
;;     ※Meadow: Windows向けのEmacs派生エディタ
;;       CarbonEmacs: Mac向けのEmacs22までのEmacs.app。
;;       CocoaEmacs: Mac向けのEmacs23以降のEmacs.app。
;;

;; ==============================================

;; 拡張機能のinit-loader を読み込む
(require 'init-loader)

;; バージョンによって、初期画面にinit log が表示される
;; これをエラー時のみ表示するように、下記の設定
(setq init-loader-show-log-after-init 'error-only)
;; ただ、上記にしてエラーなしでもログが表示される時もある、その時は、nilをセット。
;; (setq init-loader-show-log-after-init nil)

;; ちなみに、下記の機能を呼び出すと、ログを表示できる
(init-loader-show-log)

;; 設定ファイルが格納されているフォルダを指定
(init-loader-load "~/.emacs.d/conf")


;; 下記をinit.elに追加
;; ============================================

;; 分割された設定ファイルを読込
(require 'init-loader)
(setq init-loader-show-log-after-init 'error-only)
(init-loader-load "~/.emacs.d/conf")


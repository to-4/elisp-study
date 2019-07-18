;;
;;  [2019.07.18] 
;;  auto-complete 実装方法
;;
;;  - "auto-complete.el"の拡張機能で、実現する
;;    (1) インストールする為、下記のコマンドを実行
;;        "M-x package-install <RET>"
;;        "auto-complete <RET>"
;;
;;    (2) その後は、下記の様に、"init.el"に追加
;; --------------------------------------------------------

;; auto-complete の設定
(when (require 'auto-complete-config nil t)
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-config-default)
  (setq ac-use-menu-map t)
  (setq ac-ignore-case nil))

;; auto-complete-config.el を読み込むことで auto-complete も読込まれる
;; また、ac-config-default 関数を実行することでサンプル設定が有効化



;;
;;  [2019.07.05] 
;;  タブエディタ化の方法
;;
;;  - "tabbar.el"の拡張機能で、実現する
;;    拡張機能は、"M-x package-list-packages" から、"tabbar" を選んでインストール
;;  - その後は、下記の様に、"init.el"に追加
;; --------------------------------------------------------

;; 拡張機能 tabbar をロード
(require 'tabbar)
;; tabbar有効化
(tabbar-mode)

;; タブ切替にマウスホイールを使用（0：有効，-1：無効）
(tabbar-mwheel-mode -1)

;; タブグループを使用（t：有効，nil：無効）
(setq tabbar-buffer-groups-function nil)

;; ボタン非表示
(dolist (btn '(tabbar-buffer-home-button
tabbar-scroll-left-button
tabbar-scroll-right-button))
(set btn (cons (cons "" nil) (cons "" nil))))

;; ショートカットキー
(global-set-key (kbd "<C-tab>") 'tabbar-forward-tab)
(global-set-key (kbd "<C-S-tab>") 'tabbar-backward-tab) ;Ctr+Shift+Tab

;; 外観
(set-face-attribute
 'tabbar-default nil
 :family "メイリオ"
 :background "SystemMenuBar"
 :height 0.8)

;; 選択タブ
(set-face-attribute
 'tabbar-selected nil
 :background "SystemMenuBar"
 :foreground "Red3"
 :weight 'bold
 :box '(:line-width 3 :color "SystemMenuBar"))

;; 非選択タブ
(set-face-attribute
 'tabbar-unselected nil
 :background "SystemMenuBar"
 :foreground "Black"
 :box '(:line-width 3 :color "SystemMenuBar"))

(set-face-attribute
 'tabbar-separator nil
 :height 0.1)

(set-face-attribute
 'tabbar-button nil
 :box nil)


;;
;;  [2019.07.10] 
;;  Helm インストール方法
;;
;;  - "helm.el"の拡張機能で、実現する
;;    拡張機能は、
;;      まずに、"M-x package-refresh-contents"
;;      次に、"M-x package-list-packages" から、"helm" を選んでインストール
;;
;;    2019.7.11
;;      上記の方法では、"M-x helm-for-files" を実行すると、"Invalid function B" と表示されてしまった
;;      下記の方法でインストールしたところ、以上のエラーはなくなった。
;;        M-x package-install<RET>
;;        helm
;;
;;  - その後は、下記の様に、"init.el"に追加
;; --------------------------------------------------------

;; Helm
(require 'helm-config)


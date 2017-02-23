;;

;; package の拡張機能を読込
(require 'package)

;; リポジトリを追加
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;; インストールしたパッケージを読込
(package-initialize)


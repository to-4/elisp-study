;;
;;  [2019.08.22]
;;  マルチカーソルの使用方法
;;
;;  - Emacs のパッケージ multiple-cursors.el を利用すれば、
;;    カーソルを複数追加し、
;;    全てのカーソルに対し同じ操作を実行することができます。
;;
;;  - インストール方法
;;    M-x package-install [Enter] multiple-cursors [Enter]
;;
;;  - 基本的な使い方は 公式ページ に書かれており、下記をint.elに追加
;;    (require 'multiple-cursors)
;;    (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
;;    (global-set-key (kbd "C->") 'mc/mark-next-like-this)
;;    (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;;    (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;;  
;;    行選択後 C-S-c C-S-c で選択行にカーソルを追加（S は shift）
;;    C-> で次の行にカーソル追加
;;    C-< で前の行にカーソル追加
;;    単語選択後 C-c C-< で画面内のその単語全てにカーソルを追加
;;
;;    通常の使い方（連続行の複数カーソル）
;;    1. C-S-c を2回。ミニバッファに"Mark a set of lines first" と表示
;;    2. C-> で、次行にカーソル追加。または、C->で、前行にカーソル追加。
;;       1 の後に、現在カーソルを動かしても2は、何度でも行える
;;    3. C-g で終了。
;;
;;
;;    補足：
;;    init.el の内容を再起動せずに反映するには、
;;    (M-x eval-buffer)
;; --------------------------------------------------------

;; マルチカーソルを有効
   (require 'multiple-cursors)
   (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines) ;; 開始
   (global-set-key (kbd "C->") 'mc/mark-next-like-this) ;; 次行に追加
   (global-set-key (kbd "C-<") 'mc/mark-previous-like-this) ;; 前行に追加
   (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this) ;; 表示画面の選択文字と同じ文字すべてに追加



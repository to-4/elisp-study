;; load-pathに追加する関数
(defun append-to-load-path (&rest paths)
  (let ((path)(tmp-list))
    (let (load-path)
      (dolist (path paths)
	(let ((default-directory
		(expand-file-name (concat user-emacs-directory path))))
          (setq load-path (append load-path (list default-directory)))
	  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	      (normal-top-level-add-subdirs-to-load-path))))
      (setq tmp-list load-path))
    (setq load-path (append load-path tmp-list)))
  )

;; load-pathに追加(サブフォルダ含む)
(append-to-load-path "conf" "site-lisp")

;; 分割された設定ファイルを読込
(require 'init-loader)
(setq init-loader-show-log-after-init 'error-only)
(init-loader-load "~/.emacs.d/conf")

;; 追加パッケージ設定をinit.elに追記するのを防ぐ
(load
  (setq custom-file
    (expand-file-name "custom.el" user-emacs-directory))) 


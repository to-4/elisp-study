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

;; 対応する括弧をハイライトする
(setq show-paren-delay 0)
(show-paren-mode t)


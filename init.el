;; load-pathに追加する関数
(defun add-to-load-path-test (&rest paths)
  (let (path)
    (dolist (path paths)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))))

	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

;; load-pathに追加(サブフォルダ含む)
(add-to-load-path-test "conf" "site-lisp")

;; 対応する括弧をハイライトする
(setq show-paren-delay 0)
(show-paren-mode t)


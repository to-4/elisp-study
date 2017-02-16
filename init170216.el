;;
;;  [2017.02.16]
;;  ~/.emacs.d フォルダ以下に配置するフォルダ(サブフォルダも含め)をload-pathに追加
;;
;;
;;


(defun add-to-load-path-test (&rest paths)
  (let (path)
    (dolist (path paths)

      ;; "default-directory" 変数の値は、emacs自身が格納されているフォルダ
      ;; "normal-top-level-add-subdirs-to-load-path" 関数では、
      ;; この"default-directory"を使用するため、一時的に値をセット
      (let ((default-directory
	      ;; "user-emacs-directory" 変数の値は、"~/.emacs.d/"
	      ;; ※"/"が末尾についている
	      ;; "expand-file-name" は、引数パスの絶対パスを取得
	      ;; (concat user-emacs-directory path) では、
	      ;; "~/.emacs.d/[引数パス]なので、"~"を展開する為、使用。
	      (expand-file-name (concat user-emacs-directory path))
	      )
	    )

	;; パスをload-pathリストに追加
	(add-to-list 'load-path default-directory)

	;; fboundpは、シンボルが関数として束縛があるかどうかを返す
	;; 書式：(fboundp '[変数])
	;; 返り値：宣言？値？使用可能？があれば、tを返す。それ以外は、nil
	;; normal-top-level-add-subdirs-to-load-pathは、
	;; default-directory配下の全てをload-pathに追加する
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path)
	  )
	)
      )
    )
  )
(add-to-load-path-test "conf" "site-lisp")

;; 下記をinit.elに追加
;; ============================================

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



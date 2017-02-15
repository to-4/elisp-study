;;
;;  [2017.02.16]
;;  init.elファイルを作成
;;
;;


(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))
	      )
	    )
	(add-to-list 'load-path default-directory)

	;; fboundpは、シンボルが関数として束縛があるかどうかを返す
	;; 書式：(fboundp '[変数])
	;; 返り値：宣言？値？使用可能？があれば、tを返す。それ以外は、nil
	;; normal-top-level-add-subdirs-to-load-pathは、
	;; default-directory配下の全てをload-pathに追加する
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-top-load-path)
	  )
	)
      )
    )
  )

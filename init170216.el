;;
;;  [2017.02.16]
;;  ~/.emacs.d フォルダ以下に配置するフォルダ(サブフォルダも含め)をload-pathに追加
;;  なんとなくあれなので、追加分を元々の末尾に追加。(これでいいかは不明？)
;;
;;
;;

(defun add-to-load-path-test (&rest paths)
  (let ((path)(tmp-list))
    
    ;; ここでload-pathを一旦初期化(nil?)
    (let (load-path)
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
	  
	  ;; パスをload-pathリストに追加 ※末尾に
          (setq load-path (append load-path (list default-directory)))
	  
	  ;; fboundpは、シンボルが関数として束縛があるかどうかを返す
	  ;; 書式：(fboundp '[変数])
	  ;; 返り値：宣言？値？使用可能？があれば、tを返す。それ以外は、nil
	  ;; normal-top-level-add-subdirs-to-load-pathは、
	  ;; default-directory配下の全てをload-pathに追加する
	  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	      (normal-top-level-add-subdirs-to-load-path)
	    ) ;; if
	  ) ;; let (default-directory)
	) ;; do-list

      ;; 追加分パスを一時変数へ
      (setq tmp-list load-path)
      ) ;; let (load-path)

    ;; 末尾に今回指定分を追加
    (setq load-path (append load-path tmp-list))
    ) ;; let ((path)(tmp-list))
  )

(add-to-load-path-test "conf" "site-lisp")

;; 下記をinit.elに追加
;; ============================================

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



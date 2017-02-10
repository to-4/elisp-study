;;
;; [2017.02.10]
;;  while 文の書き方
;;

;; 
;; 書式：(while ([condition])
;;        [form]
;;      )
;;
;;       condition: e.g. (< i 5)
;;       form: body
;;

;; ロード：Common Lisp関数・マクロ
(require 'cl)
(let ((i 0)(sum 0))
  (while (< i 5)
    (setq sum (+ sum i))
    ;;(setq i (1+ i))		       
    ;; incf は、common lisp マクロ？らしい
    ;; これを使うには、事前に、(require 'cl)を実行すること！！
    (incf i)
  )
  (princ (int-to-string sum))
)





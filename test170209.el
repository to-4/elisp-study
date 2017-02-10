;;
;; [2017.02.09] 
;; 数値 <==> 文字列の型変換
;;

;; 
;; 数値 --> 文字列
;; 書式：(int-to-string [数値])
;; 
;; 
(let ((tmp_list (list 1 2 3)))

  (dolist (x tmp_list)
    (princ (int-to-string x))
    (princ "\n")
  )
)

;; 
;; 文字列 --> 数値
;; 書式：(string-to-int [文字列])
;; 
;; 
(let ((tmp_list (list "1" "2" "3"))(sum 0))

  (dolist (x tmp_list)
    (setq sum (+ sum (string-to-int x)))
  )
  (princ (int-to-string sum))
)





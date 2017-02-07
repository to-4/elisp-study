;;
;; [2017.01.22] 
;; loop 文の書き方
;; 
;; 書式: (dolist ([変数名] [リスト])
;;         .. [内容])
;; 
;;
;;
(setq sum 0)
(dolist (n '(1 2 3 4))
  (setq sum (+ n sum))
  (princ n)
  )
(message "sum: %d" sum)






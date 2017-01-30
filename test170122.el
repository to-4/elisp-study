;;
;; [2017.01.22] 
;; loop 文の書き方
;; 
;; - loop マクロを使用
;; - 
;;


;; loop for VAR from START to END の書き方
;; (loop for [変数] from [開始数値] to [終了数値]
;;   (条件がfalse(nil)以外の時のフォームを記述)
;;   (条件がfalse(nil)   の時のフォームを複数記述)
;; )
;; 
(setq sum 0)
(loop for i from 1 to 10
      (+ sum 1))
(message "sum: %d" sum)






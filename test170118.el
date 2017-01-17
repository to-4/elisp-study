;; 
;; [2017.01.18]
;; ローカル変数の定義方法
;; 
;; - let スペシャルフォームを使用
;; - 書き方は2通りある
;;

(setq a 1)
(setq b 1)

;; let の書き方1
;; (let ([変数名1] [変数名2] ..)
;;   … (フォームを記述)
;; )
(let (a b)
  (setq a 2)
  (setq b 3)
  (+ a b))
(message "a: %d, b: %d" a b)

;; let の書き方2
;; (let ( ([変数名1] [値1]) ([変数名2] [値2])...)
;;   … (フォームを記述)
;; )
(let ((a 2)(b 3))
  (+ a b))
(message "a: %d, b: %d" a b)





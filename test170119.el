;;
;; [2017.01.19] 
;; if 文の書き方
;; 
;; - if スペシャルフォームを使用
;; - 書き方は2通りある
;;


;; if の書き方1
;; (if [条件式] 
;;   (条件がfalse(nil)以外の時のフォームを記述)
;;   (条件がfalse(nil)   の時のフォームを複数記述)
;; )
;; ※この書き方では、falseの時しか複数式を記載できない。。。。。。
(setq a 1)
(setq b 1)
(if (equal a 1)
  (setq a 2)
  (setq a 3)
  (setq b 4)
)
(message "a: %d, b: %d" a b)

;; if の書き方2
;; (if [条件式]
;;   (progn
;;     (条件がfalse(nil)以外の時のフォームを1つ以上記述)...)
;;   (progn
;;     (条件がfalse(nil)   の時のフォームを1つ以上記述)...)
;; )
;; ※この書き方では、true(t; nil以外)の時でも、複数記載可能。
;;   progn は、Cでいうところのブロック"{ .. }"なので、if 文に限らない。
(setq a 1)
(setq b 1)
(if (equal a 1)
  (progn
    (setq a 2)
    (setq b 3))
  (progn
    (setq a 4)
    (setq b 5))
)
(message "a: %d, b: %d" a b)


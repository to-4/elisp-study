;;
;; [2017.01.27] 
;; コンスセル(cons cell) の書き方
;; 
;; - consは、construct(建設する、建造物）の略
;;   コンスセルのイメージは
;;   e.g. (1.3)   ┌---┬---┐
;;                │ 1 │ 3 │
;;                └---┴---┘
;;   左側をcar, 右側をcdrと呼ぶ。
;;     car: Contents of the Address   part of the Register
;;     cdr: Contents of the Decrement part of the Register
;;          decrement: 減少
;;     ※これらのフレーズは、Lisp が開発された頃の極めて初期 のハードウェアの特定の部分に基づくもの
;;
;; 
;;   値を評価する時の書式は、"(cons フォーム１ フォーム2)"
;;   左側を取り出す時は、"(car コンスセル)"
;;   右側を取り出す時は、"(cdr コンスセル)"
;;


;; make cons cell
(1. "one")
;; make cons cell in cons func
(cons 1 "one")

;; check difference
((+ 1 1) . 2)
(cons (+ 1 1) 2)

;; get left value
(car '(1 . "one"))
;; get right value
(cdr '(1 . "one"))

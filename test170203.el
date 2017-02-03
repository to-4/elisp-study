;;
;; [2017.02.03] 
;; 関数結果の表示の仕方
;; 
;; 書式：(princ ([関数名] ([引数リスト]))
;;      - princ は、引数の評価結果を出力する
;;      - 改行は、"\n"
;; 

;; 引数の名前を連呼して、返却する
(defun test(name)

  ;; res は、返却値
  (let (res)
    
    ;; 改行は、"\n" ※バックスラッシュ+n で、￥nではダメなので注意!
    (setq res "\n")
    (setq res (concat res "Hi " name " \n"))
    (setq res (concat res "Hi " name " \n"))
    (setq res (concat res "Hi " name " \n"))
    (setq res (concat res "Hi " name " \n"))

    ;; 最後に評価される結果が返却値
    res
    )
  )


;; テスト関数に、"john"を引数として与える。
;; 結果を"princ"関数で表示。
(princ (test "john"))




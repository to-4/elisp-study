;;
;;  [2017.02.13]
;;  リストの内容を一項目一行ずつ表示したい
;;
;;  - 各項目の文末に改行を追加
;;  - 各項目の文頭に番号を追加
;;
(defun to4-get-list-items(argList)
  (let ((num 1)(res "")(digit 0))
    (setq digit
	  (length (int-to-string (length argList))))
    (dolist (x argList)
      (let ((nums (int-to-string num)))
	(while (< (length nums) digit)
	  (setq nums (concat "0" nums))
	  )
	(setq res (concat res " " nums))
	)
      (setq res (concat res ". "))
      (setq res (concat res x))
      (setq res (concat res "\n"))
      (setq num (1+ num))
      )
    res
  )
)
(to4-get-list-items load-path)
 
      
      


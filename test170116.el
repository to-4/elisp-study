;; 
;; [2017.01.16]
;; ミニバッファに入力した内容を表示させたい
;; 
;; - interactive スペシャルフォームで、第一引数を定義して実現
;;   interactive は、defun のすぐ下（説明文があれば、その下）に配置
;;   英数字一文字をinteractiveの引数で渡せば、コマンド実行時にミニバッファから引数を取得できる
;;   取得した値は、関数そのものの引数へセットされる
;;   入力させたい値によって、引数の最初の文字を決める
;;     - 数値:  n
;;     - 文字列：s 等
;;   引数の2文字目以降が、ミニバッファに表示され、プロンプト文字列となる
;;   引数そのもののフォーマットは、文字列のため。ダブルコーテーションで括る
;;

(defun input-number(arg)
  (interactive "nNumber: ")
  (message "input-number is [%s]." arg)
  )

(defun input-string(arg)
  (interactive "sString: ")
  (message "input-string is [%s]." arg)
  )



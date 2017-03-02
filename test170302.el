;;
;;  [2017.03.02] 
;;  文字列を区切り文字で分割
;;
;;  - "split-string" 関数を使用する
;;  - subr.elに含まれる
;;  - 書式：(split-string [string] [separators])
;;          string:     分割対象文字列
;;          separators: 区切り文字列
;;    返却値：分割された文字列のリスト ※区切り文字は消える
;; 
(defun to4-view-split-items(target separator)
  (let ((sa ""))

    ;; 分割
    (setq sa (split-string target separator))

    ;; 分割文字列を表示
    (dolist (x sa)
      (princ x)
      (princ "\n"))
  )
)
(to4-view-split-items "abc:def" ":")
(to4-view-split-items (getenv "PATH") ";")

      
      


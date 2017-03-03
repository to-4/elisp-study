;; mac 用の 初期設定

;; OSの環境変数”PATH"をEmacsの環境変数"PATH"に反映
(let ((path-from-shell (replace-regexp-in-string "[ \t\n\r]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))

  ;; 環境変数 PATH にセット
  (setenv "PATH" path-from-shell)

  ;; 変数 exec-path に PATH 内容 を追加
  (dolist (x (split-string path-from-shell path-separator))
    (add-to-list 'exec-path x)))


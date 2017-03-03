;;
;; [2017.03.03] 
;; PATHの設定を反映する方法 ※mac用
;;  
;; - OSの環境変数PATHをEmacsの環境変数PATHに反映する
;;   - Macでは、ターミナルから立ち上げる場合、反映されるが
;;     Appで起動すると、反映されない為。
;;   - ※Windowsでは、OSと同じ内容となる。
;;
;; - PATH は、process-environment変数（各環境変数のリスト）に含まれる
;;   "setenv","getenv"関数で設定、取得を行う
;;   e.g. (setenv "PATH" "/usr/bin") <-- 環境変数PATHに"/usr/bin"をセット
;;
;; - 目的：
;;   Emacsでは、外部コマンドやexeを起動する時は、"exec-path"というリスト変数を使う。
;;   "exec-path"には、フォルダパスが格納されており、そのパスから指定したexe名と一致する
;;   ファイルをサーチする。
;;  
;;   この"exec-path"は、上記の環境変数"PATH"をベースに起動時(?)に設定されるので
;;   "PATH"に含まれるフォルダパスは、全て"exec-path"にもあることになる。
;;   この変数が適切じゃない場合、拡張機能で問題が発生することもあるので
;;   今回、"PATH"にOSの環境変数を反映する。
;; 
;; - 対応：
;;   OSのPATHがEmacsの環境変数に継承されないのは、macなので、macの時に読込むように作成
;;   "init-loader.el"が読込むように、"cocoa-emacs.el"ファイルを作成し、記載。
;;   
;; ------------------------------------------------------------------

(let ((path-from-shell (replace-regexp-in-string "[ \t\n\r]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))

  ;; 環境変数 PATH にセット
  (setenv "PATH" path-from-shell)

  ;; 変数 exec-path に path を追加
  (dolist (x (split-string path-from-shell path-separator))
    (add-to-list 'exec-path x)))


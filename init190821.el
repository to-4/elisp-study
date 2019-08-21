;;
;;  [2019.08.21]
;;  OS別の切替方法
;;
;;  - Emacsには、Emacsがどのような環境で利用されているかを
;;    識別するための変数が用意されている。
;;    この値を利用することで、OSの応じた柔軟な分岐を行える
;;
;;  - どのOS上で動作しているかを知るには、system-typeという変数の値を調べる
;;    (M-x describe-variable - system-type で確認)
;;  
;;    - windows-nt や cygwin: Windows
;;    - darwin: Mac  ※Darwinは、Mac OS X の基盤部分。オープンソースのOS(FreeBSDベース)
;;    - gnu/linux: Linux
;;    
;;    ※ Darwin: ASPLというライセンスに基づいたオープンソースのOS
;;               FreeBSDの高機能さに目をつけた Apple が MacOSがバージョン10になるのと
;;               同時に、FreeBSDベースのOSを開発。
;;               OS9までは、完全自社製のOS（MacOS）
;;               Darwinに、上モノとしてマウス使えたり、Safari入れたり、したものが
;;               MacOSXらしい。
;;               
;; --------------------------------------------------------

;; Macだけに読込ませる内容を書く
(when (eq system-type 'darwin)
  ;; Mac の Emacs でファイル名を正しく扱うための設定
  (require 'ucs-normalize)
  (setq file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs))



;; auto-install の設定
(when (require 'auto-install nil t)

  ;; インストールディレクトリを設定 初期値は"~/.emacs.d/auto-install/"
  (setq auto-install-directory "~/.emacs.d/site-lisp/")

  ;; EmacsWiki に登録されている elisp の名前を取得
  (auto-install-update-emacswiki-package-name t)

  ;; install-elisp の関数を利用可能に
  (auto-install-compatibility-setup))

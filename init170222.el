;;
;; [2017.02.22]
;; ELPA を利用する方法
;;  
;; - emacs24から標準搭載されている"package.el"を使用。
;;   
;; 
;; - ELPA(Emacs Lisp Package Archive;エルパ) は、リポジトリの一つ。
;;   GNU公式のもの。
;;   emacs24から標準搭載されているpackage.elでは、標準で利用可。
;;   パッケージ数は少なめ、信頼度は高い。
;;   archive: [名] 圧縮機能、格納場所、保存場所
;;   - "http://elpa.gnu.org/packages/"
;;
;; - Marmaladeは、リポジトリの一つ。
;;   - 非公式で、有志が用意したもの
;;   - MELPAにも登録されているパッケージの場合、安定板のパッケージをアップロードする作成者が多い
;;   - "https://marmalade-repo.org/packages/"
;;
;; - MELPA(Milkypostman's Emacs Lisp Package Archive)は、リポジトリの一つ。
;;   - 非公式で、有志が用意したもの
;;   - 現在最も活発に更新されている。毎日多くのパッケージが追加・更新
;;   - GitHubやBitbucket などのGitホスティングサイトと連携
;;   - "https://melpa.org/packages/"
;;
;; - melpa-stable は、リポジトリの一つ。
;;   - MELPAでは、不安定なバージョンも含まれるため
;;     ここでは、安定バージョンが優先して取得される
;;   - "https://stable.melpa.org/packages/"
;;
;; 
;; - init-loaderを使うため、
;;   20-package.elファイルを作成し、初期設定はそこへ記載。 
;;
;; 
;; 


;; ---------------------------------------------------------------------------------
;; package の拡張機能を読込
(require 'package)

;; リポジトリを追加
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;; インストールしたパッケージを読込
(package-initialize)

;; ---------------------------------------------------------------------------------

;;
;; - 使い方
;;   1. "M-x list-packages" [RET] で、"*Packages*"バッファが開かれて利用可能なパッケージが表示される
;;      この時に、"~/.emacs.d/elpa” が作成され、
;;      同時に、[elpa]フォルダの直下に[archives]フォルダとその配下に[gnu][marmalade][melpa] が作成される。
;;      その3つのフォルダそれぞれに、”archive-contents”ファイルが作成される（内容は、パッケージ一覧？）
;;   
;;   2. インストール対象の行で"i"を押すと、候補として"I"が付く。  
;;   3. "x"を押すと、"Install package '[パッケージ名]'? (y or n) が表示され、"y"を押すとインストールが開始される。
;;   4. "Package menu: Operation finished ~" と表示されたら、完了。
;;
;; - インストールの流れ
;;   1. パッケージが"~/.emacs.d/elpa/[バッケージ名]にダウンロードされます
;;      ※[パッケージ名]フォルダは自動で作成される
;;   2. バイトコンパイルされる (elcファイルが作成される)
;;   ※ なお、"~/.emacs.d/elpa/[パッケージ名]は、自動的に"load-path"に追加される
;;
;; - init.el の更新
;;   インストール完了すると、下記のような記載がinit.elに追加される
;;   ”//"から始まる行はこちらでメモした内容
;;

;; // "custom-set-variables"機能は、"custom.el"で定義された関数
;; // 変数に値をセットできる？
;; // 
;; // Emacsにはdefcustom というマクロがあり、パッケージ開発者はユーザが変更できる
;; // 変数を定義する場合、defvarではなく、defcustom を使うのが一般的らしい
;; // defcustom で定義された変数は、ユーザが customize-variable 関数など
;; // customize-* 関数で手軽に値を変更しやすいようになっている。
;; // 
;; // customize-* 関数で変更した変数は custom-set-variables 関数により
;; // 変数名(シンボル) と 値のペアが 'user の'theme-settings に登録されるよう
;; // 
;; // custom-set-variables 関数は、値をセットする際にカスタム変数に定義された
;; // セッター関数を実行するなど、setq 関数とは違った機能があるため、使用推奨？
;; // 
;; (custom-set-variables
;;  
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.

;;  // "package-selected-packages"は、package.elで、定義されている変数
;;  // この変数に、インストールしたパッケージ名が格納される
;;  // ※例として、"redo+" と "auto-complete"をインストール時の内容を記載
;;  // (quote [object]) は、スペシャルフォーム quote で、objectを評価せずに含める
;;  // 下記の場合、『(auto-complete redo+)』をそのままセット？
;;  '(package-selected-packages (quote (auto-complete redo+))))

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
;;   
;; 
;; - custom-set-variables 設定の外出し
;; 
;;   上記のように、init.elにcustom-set-variablesの設定が追記されてしまう
;;   下記の設定をinit.elに加えると、書き出し先を
;;   "~/.emacs.d/custom.el"に変更できる。
;;   ;; 追加パッケージ設定をinit.elに追記するのを防ぐ
;;   (load
;;     (setq custom-file
;;       (expand-file-name "custom.el" user-emacs-directory))) 
;;  
;;   ※customize-variables 等で設定される内容は、例えば[Options]-[Customize Emacs] 等で、
;;   　テーマを変えたりすると、記載される。これらは、デフォルトだと、init.elの末尾に追記されてしまう。
;;   
;;   上記の記述を"init.el"の末尾に追記。
;;   emacsを立ち上げると、"custom.el"が無いとエラーが表示されるが、
;;   何か、パッケージをインストールし、
;;   "M-x list-packages" とすると、~/.emacs.d/に"custom.el"が自動生成される。
;;   
;; ---------------------------------------------------------------------------------

;; 
;; - 自動インストール設定
;;   - package.elでは、指定したパッケージを自動インストールしてくれる機能もある
;;     下記のように記載
;;     ※まだ詳細不明の為、コメントアウト
;; 

;; ;; 拡張機能clを読み込む
;; (require 'cl)

;; (defvar installing-package-list
;;   '(
;;     ;; 下記にパッケージを書く
;;     open-junk-file
;;     ))

;; (let ((not-installed (loop for x in installing-package-list
;; 			   when (not package-installed-p x))
;; 		     collect x))
;;   (when not-installed
;;     (package-refresh-contens)
;;     (dolist (pkg not-installed)
;;       (package-install pkg))))






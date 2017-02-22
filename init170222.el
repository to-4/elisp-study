;;
;; [2017.02.22]
;; ELPA を利用する方法
;;  
;; - emacs24から標準搭載されている"package.el"を使用。
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

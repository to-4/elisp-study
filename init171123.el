;;
;; [2017.11.23]
;; 文字フォントを設定する方法
;;  
;; - 文字フォントは、ここではdefaultフェイスを設定する
;;   - 英字フォントは、"set-face-attribute" 関数を使用
;;   - 日本語フォントは、"set-face-font"と"font-spec"を使用
;;   
;; - 英字フォントの指定方法：
;;   下記のように、init.el に記載
;;   ;; 設定：Asciiフォント
;;   (set-face-attribute 'default nil
;;                       :family "[フォント名]")
;;
;;   default: フェイス名 ※defaultは、通常のテキスト入力値のフォント情報
;;                       フェイスは、さまざまなものがあり、このコメント行は
;;                       "font-lock-comment-face"というフェイスが適用される
;;   nil: frame が nil
;;   ==> frame名を指定しないか、nilだった場合は新規のframeだけでなく既存のframeにも設定する
;;   :family "[フォント名]": 属性の一つであるフォント名を指定
;;   ※ 上記のように ":[属性名] [値]" で指定し、スペースで区切れば、複数の属性を一度に指定することもできる
;;      例. (set-face-attribute 'default nil
;;                              :family "[フォント名]"
;;                              :height 120)
;;
;;
;;   ※face: [名]4a(書類の)文面, 4d(活字・版の) 面、字面
;;   ※attribute: [名]1 属性(その物事が持っている性質)、特性、特質
;;
;; - 日本語フォントの指定方法：
;;   下記のように、init.el に記載
;;   ;; 設定：日本語フォント
;;   (set-fontset-font
;;    nil 'japanese-jisx0208
;;    (font-spec :family "[フォント名]"))
;;
;;   - set-fontset-font: フォントセットに変更を加える
;;     - 第一引数：フォントセット名。ここでは、nilを指定
;;     - 第二引数: キャラクタセット名。ここでは、'japanese-jisx0208 を指定
;;     - 第三引数: font-spec オブジェクト。font-spec関数で返します
;;                font-spec 関数は、複数の属性情報を引数に指定可能
;;                ここでは、":family "[フォント名]""を指定します
;;                specは、specify(指定する)の略？
;;   
;; 
;; - その他のフォント関連コマンド
;;   M-x describe-face: これを実行すると、ミニバッファに下記の様に表示される
;;                      Describe face (default 'font-lock-comment-face')
;;                      ()の中の''で囲まれた部分がカーソル部分のフェイスということになる
;;                      ※()の最初のdefaultは固定。
;;                      RETで、そのフェイス内容が表示される
;;
;;   M-x list-character-sets: character setの一覧を表示
;;                            character setは、asciiやjapanese-jisx0208,unicode等
;;   M-x list-charset-chars RET [character set] : character set の文字一覧表示
;;                            例えば [character set]にasciiとすると、
;;                            ascii 文字の一覧を表示できる
;;   C-u C-x=: カーソル位置の文字情報を調べる
;;   M-x list-faces-display: フェイス一覧が表示される
;;                           さらに、フェイス名をRETすると
;;                           各属性情報（font-family(フォント名),height(高さ)等)
;;                           を確認、設定？可能
;;   
;; ------------------------------------------------------------------

  ;; 

  ;; Asciiフォントを設定
   (set-face-attribute 'default nil
                       :family "Osaka"
		       :height 140)

  ;; 日本語フォントを設定
  (set-fontset-font
   nil 'japanese-jisx0208
   (font-spec :family "Osaka"
	      :height 140))
 
;; M-x eval-buffer RET: カレントバッファをすべて評価
;; M-x eval-region RET: リージョン選択範囲を評価

;;
;;  [2019.07.05] 
;;  フォントの横幅を調節する
;;
;;  - "set-fontset-font"で設定したフォントのサイズ調整は
;;    "face-font-rescale-alist"から行います
;;    
;;  - (add-to-list 'face-font-rescale-alist '(".[フォント名の正規表現]" .[横幅の倍率]))  
;;    例.
;;    ;; Notoフォントの横幅を調整
;;    (add-to-list 'face-font-rescale-alist '(".*Noto.*" .1.2))
;;    上記の場合、実際の横幅より1.2倍横幅をとる感じになる。
;;    フォントによって、幅は異なるのでフォントを変更する時は、セットで変えるようにしたい
;;    
;;  - フォントセット【font set】
;;    ページレイアウトソフトなどで、異なるフォントをセットで扱う機能。
;;    たとえば、英数字はTimesにし、かな・漢字は細明朝体にするというような組み合わせで登録できる。
;;    テキストにこのフォントセットを指定すると、そのテキストの英数字はTimesに、かな・漢字は細明朝体になる。
;; 
;;  - 使用中のフォントセットを表示する
;;    *scratch* buffer にて
;;    (frame-parameter nil 'font) [c-j]
;;     "-outline-Courier New-normal-normal-normal-mono-13-*-*-*-c-*-iso8859-1"
;; 
;;  - その他のフォント関連コマンド
;;    M-x describe-face: これを実行すると、ミニバッファに下記の様に表示される
;;                       Describe face (default 'font-lock-comment-face')
;;                       ()の中の''で囲まれた部分がカーソル部分のフェイスということになる
;;                       ※()の最初のdefaultは固定。
;;                       RETで、そのフェイス内容が表示される


;; Asciiフォントを設定
(set-face-attribute 'default ;; フェイス名
		    nil
                    :family "Consolas"
		    :height 100)

;; 日本語フォントを設定
(set-fontset-font t ;; フォントセット名 ※t の場合、default fontset 
		  'japanese-jisx0208
		  (font-spec :family "メイリオ"
			     :height 100))

;; メイリオフォントの横幅を調整
;;(setq face-font-rescale-alist '(("メイリオ" . 1.13)))
(add-to-list 'face-font-rescale-alist '("メイリオ" . 1.13))


;;  補足：
;;  ------------------
;;  - XLFD （X Logical Font Description）
;;    ・Emacsでも採用されている次のようなフォントの表記方法
;;    ・フォントの要素を "-" で区切って並べる
;;    ・要素の指定を省略する場合は、ワイルドカード*を指定
;;    ・もともとはUNIX上のX Window Systemで用いられていた
;;   例.
;;   "-outline-Courier New-normal-normal-normal-mono-13-*-*-*-c-*-iso8859-1"
;;   
;;   01.maker	フォントの製造者名。MacOSXやWindowsでは常に省略？
;;   02.family	フォントファミリー
;;   03.weight	フォントウエイト。bold（ボールド）、medium、lightなど
;;   04.slant	normal（通常体）、italic（イタリック）、oblique（斜体）など
;;   05.widthtype	フォントの幅。通常は、normal、condensed、semicondensed、extendedのいずれか
;;   06.style	追加のスタイル。通常は省略
;;   07.pixels	フォントの高さをピクセル単位で指定。heightを指定した場合は省略
;;   08.height	フォントの高さをプリンターのポイントの1/10の単位で指定。pixelsを指定した場合は省略
;;   09.horiz	水平解像度（horizontal resolution）。通常は省略
;;   10.vert	垂直解像度(vertical resolution)。通常は省略
;;   11.spacing	文字の間隔。m（monospace）、p（proportional）、c（character cell）のいずれか
;;   12.width	Emacsでは通常0？
;;   13.registryとencoding	Emacsでは通常、iso8859-1
;;
;;   下記は、”M-x list-fontsets” の結果の一つ
;;   " -*-*-*-*-*-*-*-*-*-*-*-*-fontset-default"



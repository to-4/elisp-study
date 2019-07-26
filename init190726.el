;;
;;  [2019.07.29]
;;  タイトルバーの表示を変更
;;
;;  - 変数の"frame-title-format" に 値をセット
;;    現在の情報は、"M-x describe-variable" - "frame-title-format" で確認
;;    
;;    (setq frame-title-format '("" [表示情報]))
;;    
;;    表示情報には、複数の情報を 半角スペース区切りで 組合せできる
;;    - invocation-name: "emacs" を取得
;;    - emacs-version: Emacs のバージョン
;;    - system-name: コンピュータ名
;;    - buffer-file-name: バッファーのファイル名
;;    - "%b": バッファー名
;;    - "%f": フルパス。buffer のみの場合、nil(空文字列が表示される)
;;    
;; --------------------------------------------------------

;; タイトルバー (" " [バッファ名] with emacs [バージョン] @ [コンピュータ名])

(setq frame-title-format '("" "%b with " invocation-name " " emacs-version " @ " system-name))


;;
;; [2017.01.30] 
;; リスト(list) の書き方
;; 
;; - elisp の listは、データ構造の一つである "連結リスト" の "線形リスト" の "片方向リスト" を指す。
;;   - 連結リスト【Linked list; リンクトリスト】: データ構造の一つ。基本的な構造。
;;                                             一連のノードが、任意のデータフィールド群をもち、
;;                                             1つ2つの参照（リンク）により次（及び前）のノードを指している。
;;   - 線形リスト【linear list】: 連結リストの一つ。
;;                              片方向リストと双方向リストの2種類で構成される。
;;                              どちらも任意の位置でデータの追加・削除が"O(1)"時間でできる。
;;   - 片方向リスト【singly-linked list】: 線形リストの一つ。
;;                                       最も単純な連結リスト。ノード毎に1つのリンクを持つ。
;;                                       このリンクは次のノードを指し、最後尾は、Null値を格納。
;;  
;; - 具体的には、コンスセルのcdrにコンスセルをつなげたもの。
;;   それぞれのコンスセルのcarにデータを格納。
;;   list のイメージは
;;   e.g. (1 3 5)   ┌---┬---┐   ┌---┬---┐   ┌---┬-----┐
;;                  │ 1 │ * --> │ 3 │ * --> │ 5 │ nil │
;;                  └---┴---┘   └---┴---┘   └---┴-----┘
;;
;;     
;;     car: Contents of the Address   part of the Register
;;     cdr: Contents of the Decrement part of the Register
;;          decrement: 減少
;;     ※これらのフレーズは、Lisp が開発された頃の極めて初期 のハードウェアの特定の部分に基づくもの
;;
;;   --------------
;;   リスト定義は、"(値1 値2 …)"
;;               "(list フォーム1 フォーム2 …)" ※フォーム評価結果からなるリスト
;;   リストを変数に代入する時、リストの先頭のコンスセルの場所を指す。
;;   リストの先頭に要素を追加するには、新しいコンスセルを用意し、
;; 　                              carに追加要素、cdrに元のリスト（のコンスセル）をセット。
;;   
;;   リストの要素を取り出すには、"(nth インデックス リスト)"
;;   返り値が、リストのインデックス番目の要素となります
;;
;;   nth/énθ/ [形]n番目の; n倍の; n次の
;;
;;   --------------
;;   リストに追加する方法は
;;     1. "(setq [リスト] (cons [追加する値] [リスト])"
;;     2. "(add-to-list '[リスト] [追加する値])"
;;     3. "(setq [リスト]
;;               (append [リスト] '("[追加する値)")))
;;     ※1,2は、先頭に追加。3は、末尾に追加。(appendは、『リストを結合する関数』)
;;       append /əpénd/ [動]〈付録などを〉〔…に〕添える，付加[追加]する〔to〕
;;       e.g. append notes to a book (本に注を添える)
;;

;; make list
(cons 1 (cons 2 (cons 3 nil)))
(list 1 2 3)
'(1 2 3)

;; add list
;; - cons cell
(setq lst (cons 3 nil))
(setq lst (cons 2 lst))
(setq lst (cons 1 lst))
;; - add-to-list
(setq lst2 (cons 3 nil))
(add-to-list 'lst2 2)
(add-to-list 'lst2 1)
;; - append
(setq lst3 (cons 1 nil))
(setq lst3
      (append lst3 '(2)))
(setq lst3
      (append lst3 '(3)))

;; get car of list
(car lst)
;; get cdr of list
(cdr lst)

;; get element in the list
(nth 0 lst)
(nth 1 lst)
(nth 2 lst)
(nth 3 lst)
(nth 4 lst)

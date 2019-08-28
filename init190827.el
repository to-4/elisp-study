;;
;;  [2019.08.27]
;;  power line でモードライン変更
;;
;;  - powerline は、シェルやエディタなどのステータスラインを
;;    リッチに機能的にしてくれるツール。
;;    見た目もかなりかっこよくなる
;;    vim にあったものだが、emacs でも実現可能。
;;    
;;  - インストール方法
;;    M-x package-install [Enter] power-line [Enter]
;;
;;  - 後は、下記の内容をinit.elに貼り付ける
;;    
;;    補足：
;;    init.el の内容を再起動せずに反映するには、
;;    (M-x eval-buffer)
;;
;;    powerline-raw:
;;      syntax: (powerline-raw STR &optional FACE PAD)
;;      description: Render STR as mode-line data using Face
;;                     and optionally PAD import on left (l) or right (r).
;;                   render: [他動] 5a. 表現する、描写する render a landscape (風景を描く)
;;                   raw: [形] 2 未加工の
;;
;;    setq-default:
;;      すべてのバッファに影響
;;    
;;       
;; --------------------------------------------------------


;; powerline
(require 'powerline)

(defun powerline-my-theme ()
  "Setup the my mode-line."
  (interactive)
  (setq powerline-current-separator 'utf-8)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face1 (if active 'mode-line-1-fg 'mode-line-2-fg))
                          (face2 (if active 'mode-line-1-arrow 'mode-line-2-arrow))
                          (separator-left (intern (format "powerline-%s-%s"
                                                          (powerline-current-separator)
                                                          (car powerline-default-separator-dir))))
                          (lhs (list (powerline-raw        " " face1)
                                     (powerline-major-mode face1)
                                     (powerline-raw        " " face1)
                                     (funcall separator-left face1 face2)
                                     (powerline-buffer-id nil )
                                     (powerline-raw " [ ")
                                     (powerline-raw mode-line-mule-info nil)
                                     (powerline-raw "%*")
                                     (powerline-raw " |")
                                     (powerline-process nil)
                                     (powerline-vc)
                                     (powerline-raw " ]")
                                     ))
                          (rhs (list (powerline-raw "%4l")
                                     (powerline-raw ":")
                                     (powerline-raw "%2c")
                                     (powerline-raw " | ")                                  
                                     (powerline-raw "%6p")
                                     (powerline-raw " ")
                                     )))
                     (concat (powerline-render lhs)
                             (powerline-fill nil (powerline-width rhs)) 
                             (powerline-render rhs)))))))

(defun make/set-face (face-name fg-color bg-color weight)
  (make-face face-name)
  (set-face-attribute face-name nil
                      :foreground fg-color :background bg-color :box nil :weight weight))
(make/set-face 'mode-line-1-fg     "#282C34" "#EF8300" 'bold)
(make/set-face 'mode-line-2-fg     "#AAAAAA" "#2F343D" 'bold)
(make/set-face 'mode-line-1-arrow  "#AAAAAA" "#3E4451" 'bold)
(make/set-face 'mode-line-2-arrow  "#AAAAAA" "#3E4451" 'bold)

(powerline-my-theme)

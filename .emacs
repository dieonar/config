
;;Loading modules:
(load "~/.emacs.d/std_comment.el") ; Epitech Header module
(load "~/.emacs.d/linum.el") ; Displays line number
(load "~/.emacs.d/yasnippet.el")



(custom-set-variables
 '(linum-mode t))
(setq linum-format "%4d \u2502")
;(setq linum-format "%4d |")
(custom-set-faces
 '(linum ((t (:inherit default :foreground "orange")))))
(global-linum-mode 1)


(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/snippets")

(load "~/.emacs.d/auto-complete.el") ; Auto-Complete module
(load "~/.emacs.d/auto-complete-yasnippet.el")
(require 'auto-complete)
(global-auto-complete-mode t)           ;enable global-mode
(setq ac-auto-start t)                  ;automatically start
(setq ac-dwim t)                        ;Do what i mean
(set-default 'ac-sources '(ac-source-yasnippet ac-source-abbrev ac-source-words-in-buffer))

(require 'paren)
(show-paren-mode t)
(setq blink-matching-paren t)
(setq blink-matching-paren-on-screen t)
(setq blink-matching-paren-dont-ignore-comments t)

;; Creating binding:
;;(global-set-key [f1] 'create_header)
(global-set-key [f2] 'linum-mode)
(global-set-key [f3] 'iwb)


(custom-set-variables
 '(backward-delete-char-untabify-method nil)
 '(show-trailing-whitespace t))
(custom-set-variables
 '(global-hl-line-mode t)
 )

(menu-bar-mode -1)

(column-number-mode t)
(line-number-mode t)
(add-hook 'c-mode-hook
	  '(lambda()
	     (require 'whitespace)
	     (setq whitespace-line-column 79)
	     (setq whitespace-style '(lines lines-tail trailing))
	     (global-whitespace-mode t)
	     )
	  )

(custom-set-faces
 '(highlight ((t (:height 2.0 :weight bold))))
 '(linum ((t (:foreground "#907c3c"))))
 '(font-lock-function-name-face ((t (:foreground "#0000ff" :weight bold))))
 '(font-lock-comment-delimiter-face ((t (:foreground "#0000ff"))))
 '(font-lock-comment-face ((t (:foreground "#0000ff"))))
 '(font-lock-warning-face ((t (:foreground "#ff0000" :weight bold))))
 '(font-lock-doc-face ((t (:foreground "#00ff00" :weight bold))))
 '(vertical-border ((t (:foreground "#f6f3e8" :background "#111111"))))
 '(mode-line ((default (:foreground "#f6f3e8" :background "#111111"))))
 '(whitespace-line ((t (:foreground "#ff0000" :background "#111111" :weight bold))))
 )


(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

;; Allows to delete selection with Suppr keywords
(delete-selection-mode 1)


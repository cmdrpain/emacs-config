(setq ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)


(setq ac-auto-start nil
      ac-quick-help-delay 0.5
      ac-use-menu-map t
      ac-dwim-enable t)

(ac-set-trigger-key "TAB")

(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)

(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(add-to-list 'ac-modes 'slime-repl-mode)

(defvar irony-elisp-dir (concat pkg-dir "irony-mode/elisp/"))
(add-to-list 'load-path irony-elisp-dir)
(add-to-list 'load-path (concat irony-elisp-dir "plugins" ))

(require 'irony)
(require 'irony-ac)

(add-hook 'c-mode-common-hook 'irony-mode)

(define-key irony-mode-map "\C-i" 'ac-complete-irony)
(define-key irony-mode-map "\C-i" 'complete-or-indent)

(defun complete-or-indent ()
  (interactive)
  (if (string-match "\\w" (char-to-string (preceding-char)))
      (ac-complete-irony)
    (indent-according-to-mode)))


(defun my-ac-cc-mode-setup ()
  (setq ac-sources '(ac-source-irony
		     ac-source-yasnippet
		     ac-source-filename
		     ac-source-abbrev ac-source-dictionary)))

(defun my-ac-config-default ()
  (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  (add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
  (add-hook 'css-mode-hook 'ac-css-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))

(my-ac-config-default)


;; (require 'completion-ui)
;; (define-key emacs-lisp-mode-map "\C-i" 'complete-elisp)

(add-hook 'inferior-lisp-mode-hook 'auto-complete-mode)

;; (add-hook 'ielm-mode-hook 'auto-complete-mode)
;; (define-key ielm-map "\C-i" 'auto-complete)

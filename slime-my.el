(load (expand-file-name "~/quicklisp/slime-helper.el"))
(require 'slime-autoloads)
(slime-setup '(slime-fancy slime-asdf slime-editing-commands
			   slime-highlight-edits slime-xref-browser slime-presentations
			   slime-fancy-inspector))

(setq slime-lisp-implementations
      (list (list 'cmucl '("/usr/bin/cmucl") :init 'slime-init-command)
	    (list 'clisp '("/usr/bin/clisp" "-ansi") :init 'slime-init-command)
	    (list 'sbcl '("/usr/bin/sbcl") :init 'slime-init-command)
	    (list 'ecl '("/usr/bin/ecl") :init 'slime-init-command)
	    (list 'ccl '("/usr/bin/ccl") :init 'slime-init-command)))

(setq slime-default-lisp 'sbcl)

(setq slime-net-coding-system 'utf-8-unix)
(setq common-lisp-hyperspec-root "file:/home/andy/clisp/HyperSpec/")

(add-to-list 'auto-mode-alist '("\\.asd$" . lisp-mode))
(add-to-list 'auto-mode-alist '("\\.lisp$" . lisp-mode))


(defun my-slime-lisp-mode-hook ()
  (if (not (or
	    (string-match ".el$" (buffer-name))
	    (string-match ".emacs" (buffer-name))
	    (string-match ".lsp$" (buffer-name))
	    (string= mode-name "Lisp")))
      (slime-mode 1)))

(add-hook 'lisp-mode-hook 'my-slime-lisp-mode-hook)

;;; repl


;; (eval-if-featurep
;;  '(paredit auto-complete) t nil
;;  (defun my-slime-repl-mode-hook ()
;;    (define-key slime-repl-mode-map "\M-s" 'paredit-splice-sexp)
;;    (define-key slime-repl-mode-map "\M-r" 'paredit-raise-sexp)
;;    (define-key slime-repl-mode-map "TAB" 'ac-trigger-key-command))
;;  (add-hook 'slime-repl-mode-hook 'my-slime-repl-mode-hook))

(eval-after-load 'paredit
  '(eval-after-load 'auto-complete
     '(progn
	(defun my-slime-repl-mode-hook ()
	  (define-key slime-repl-mode-map "\M-s" 'paredit-splice-sexp)
	  (define-key slime-repl-mode-map "\M-r" 'paredit-raise-sexp)
	  (define-key slime-repl-mode-map "TAB" 'ac-trigger-key-command))
	(add-hook 'slime-repl-mode-hook 'my-slime-repl-mode-hook))))


(eval-after-load 'paredit
  '(progn
     (defun override-slime-repl-bindings-with-paredit ()
       (define-key slime-repl-mode-map
	 (read-kbd-macro paredit-backward-delete-key) nil))
     (add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)))

;; (eval-if-featurep
;;  '(paredit) t nil
;;  (defun override-slime-repl-bindings-with-paredit ()
;;    (define-key slime-repl-mode-map
;;      (read-kbd-macro paredit-backward-delete-key) nil))
;;  (add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit))

;;; slime-mode
(defun my-slime-mode-hook ()
  (define-key slime-mode-map "\C-c\C-q" 'slime-reindent-defun)
  (define-key slime-mode-map "\C-c\C-s" 'slime-complete-form)
  (eval-if-featurep '(auto-complete) t nil
		    (define-key slime-repl-mode-map "TAB" 'ac-trigger-key-command)))

(add-hook 'slime-mode-hook 'my-slime-mode-hook)


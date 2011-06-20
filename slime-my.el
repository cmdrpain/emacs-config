(load (expand-file-name "~/quicklisp/slime-helper.el"))
(require 'slime-autoloads)
(slime-setup '(slime-fancy slime-asdf slime-editing-commands slime-company
			   slime-highlight-edits slime-xref-browser slime-presentations
			   slime-fancy-inspector))

(setq slime-lisp-implementations
      (list (list 'cmucl '("/usr/bin/cmucl") :init 'slime-init-command)
	    (list 'clisp '("/usr/bin/clisp" "-ansi") :init 'slime-init-command)
	    (list 'sbcl '("/usr/bin/sbcl") :init 'slime-init-command)
	    (list 'ecl '("/usr/bin/ecl") :init 'slime-init-command)
	    (list 'ccl '("/usr/bin/ccl") :init 'slime-init-command)))

(setq slime-default-lisp 'sbcl)

;; (setq slime-net-coding-system 'utf-8-unix)
(setq common-lisp-hyperspec-root "file:/home/andy/clisp/HyperSpec/")

(add-to-list 'auto-mode-alist '("\\.asd$" . lisp-mode))
(add-to-list 'auto-mode-alist '("\\.lisp$" . lisp-mode))

(defun my-slime-mode-hook ()
  (company-mode 1)
  (set (make-local-variable 'company-backends)
       '(slime-company-backend))
  (local-set-key "\C-c\C-q" 'slime-reindent-defun)
  (local-set-key "\C-c\C-s" 'slime-complete-form)
  ;; (local-set-key "\M-DEL" 'slime-xref-)
  )

(add-hook 'slime-mode-hook 'my-slime-mode-hook)

;;(defun my-slime-lisp-mode-hook ()
;;  (if (not (or
;;	    (string-match ".el$" (buffer-name))
;;	    (string-match ".emacs" (buffer-name))
;;	    (string-match ".lsp$" (buffer-name))))
;;     (slime-mode 1)))

(defun my-slime-lisp-mode-hook ()
  (unless (string= mode-name "Lisp")
    (slime-mode 0)))


(add-hook 'lisp-mode-hook 'my-slime-lisp-mode-hook)

;;; this makes slime-repl-mode enable in buffers in which it shouldn't
;; (add-hook 'slime-repl-map-mode
;; 	  '(lambda nil
;; 	     (progn
;; 	       (local-set-key "\M-s" nil)
;; 	       (local-set-key "\M-r" nil)
;; 	       (local-set-key [C-M-r] 'slime-repl-previous-matching-input)
;; 	       (local-set-key [C-M-s] 'slime-repl-next-matching-input)
;; 	       (unless (string= mode-name "REPL")
;; 		 (slime-repl-map-mode 0)))))


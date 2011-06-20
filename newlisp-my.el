;;(add-to-list 'load-path (expand-file-name "/usr/share/emacs/site-lisp/newlisp-mode"))
(add-to-list 'auto-mode-alist '("\\.lsp$" . newlisp-mode))
(autoload 'newlisp-mode "newlisp" "Turn on NewLisp mode" t)

;;; newlisp.el, which is derived from scheme.el
;;; somehow treats | as parantheses
;;; which i do not like, because in newlisp | is an OR bit operator

;; (defvar my-newlisp-syntax-table
;;   (let ((table (make-syntax-table)))
;;     (modify-syntax-entry ?| "w" table)
;;     table))

;; (defun my-newlisp-mode-hook ()
;;   (set-syntax-table my-newlisp-syntax-table)
;;   (define-key newlisp-mode-map "\C-c\C-z" 'newlisp-show-interpreter)
;;   (define-key newlisp-mode-map "\C-c\C-l" 'newlisp-evaluate-buffer)
;;   (define-key newlisp-mode-map [(control meta x)] 'newlisp-evaluate-toplevel))

;; (add-hook 'newlisp-mode-hook 'my-newlisp-mode-hook)


;;;_#24 allout

(defvar rf-allout-font-lock-keywords
  '( ;;This breaks/disables fontifying of org-mode buffers
    ;; Highlight headings according to the level.
    (eval . (list (concat "^\\(" outline-regexp "\\).+")
		  0 '(or (cdr (assq (outline-depth)
				    '((1 . font-lock-function-name-face)
				      (2 . font-lock-variable-name-face)
				      (3 . font-lock-keyword-face)
				      (4 . font-lock-builtin-face)
				      (5 . font-lock-comment-face)
				      (6 . font-lock-constant-face)
				      (7 . font-lock-type-face)
				      (8 . font-lock-string-face))))
			 font-lock-warning-face)
		  nil t)))
  "Additional expressions to highlight in Outline mode.")

;; add font-lock to allout mode
(defun rf-allout-font-lock-hook ()
  (set (make-local-variable 'font-lock-defaults)
       '(rf-allout-font-lock-keywords t nil nil outline-back-to-current-heading)))

(defun my-allout-hook ()
  (define-key allout-mode-map "C"))

;; (add-hook 'outline-mode-hook 'rf-allout-font-lock-hook)
;;;_#25 which-func mode

;; (delete (assoc 'which-func-mode mode-line-format) mode-line-format)
;; (setq which-func-header-line-format
;;               '(which-func-mode
;;                 ("" which-func-format
;;                  )))
;; (defadvice which-func-ff-hook (after header-line activate)
;;   (when which-func-mode
;;     (delete (assoc 'which-func-mode mode-line-format) mode-line-format)
;;     (setq header-line-format which-func-header-line-format)))

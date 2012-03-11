;;; as it seems autocomplete doesn't crash emacs when using pos-tip
;;; and irony-mode has support for auto-complete there's no point
;;; for me to be using company-mode, for now.

(autoload 'company-mode "company" nil t)

;; (setq company-backends
;;       '(company-keywords
;; 	;; company-daabrev
;; 	company-elisp
;; 	company-clang))


;; (defmacro add-company-backend-to-mode (mode-hook company-backend)
;;   `(add-hook ,mode-hook (lambda ()
;; 			  (set (make-variable-buffer-local 'company-backends) '(,company-backend)))))

;; (add-company-backend-to-mode 'c-mode-common-hook company-clang)
;; (add-company-backend-to-mode 'emacs-lisp-mode-hook company-elisp)
;; (add-company-backend-to-mode 'slime-mode-hook slime-company)


(defun my-company-mode-hook ()
  (define-key company-active-map (kbd "\C-n") 'company-select-next)
  (define-key company-active-map (kbd "\C-p") 'company-select-previous)
  (define-key company-active-map (kbd "\C-d") 'company-show-doc-buffer)
  (define-key company-active-map (kbd "\C-w") 'backward-kill-word)
  (define-key company-active-map (kbd "\C-v") 'company-show-location)
  ;; (define-key company-active-map (kbd "<tab>") 'company-complete)
  (define-key company-active-map (kbd "\C-g") 'company-abort)
  (define-key company-mode-map "\C-i" 'company-complete))

(add-hook 'company-mode-hook 'my-company-mode-hook)


(my-add-hooks '(emacs-lisp-mode-hook
		c-mode-common-hook
		lisp-mode-hook
		slime-mode-hook) 'company-mode)

;; (defun complete-or-indent ()
;;   (interactive)
;;   (if (and
;;        (string-match "\\w" (char-to-string (preceding-char)))
;;        (company-manual-begin))
;;       (company-complete-common)
;;     (indent-according-to-mode)))

;;; something's fucked with this
(defun complete-or-indent ()
  (interactive)
  (if (string-match "\\w" (char-to-string (preceding-char)))
      (company-complete)
    (indent-according-to-mode)))

(setq company-idle-delay nil)
(setq company-begin-commands '(self-insert-command))

;;(global-company-mode 1)
;;(global-company-mode-enable-in-buffers)


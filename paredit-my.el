(autoload 'paredit-mode "paredit.el"
  "Minor mode for pseudo-structurally editing Lisp code."
  t)

(defun paredit-hook ()
  (highlight-parentheses-mode t)
  (paredit-mode t))

(mapc (lambda (x) (let ((mode (intern (concat (symbol-name x) "-mode-hook"))))
		    (add-hook mode 'paredit-hook)))
      '(slime-repl slime emacs-lisp inferior-lisp ielm))


(eval-after-load "eldoc"
  '(eldoc-add-command
    'paredit-backward-delete
    'paredit-close-round))

(eval-after-load "paredit"
  '(progn
     (define-key paredit-mode-map "\C-w" 'paredit-backward-kill-word)
     ;; (global-set-key "\C-k" 'paredit-kill)
     (define-key paredit-mode-map "\\" 'self-insert-command)
     (define-key paredit-mode-map "\M-[" 'scroll-down)))


(require 'yasnippet)

(setq yas/prompt-functions '(yas/completing-prompt))
(setq yas/wrap-around-region t)
(setq yas/root-directory (concat lisp-dir "pkgs/yasnippet/snippets"))

(yas/load-directory yas/root-directory)
(setq yas/trigger-key "[(super i)]")
(global-set-key (kbd "C-c C-SPC") 'yas/insert-snippet)

(my-add-hooks '(lisp-mode-hook
		emacs-lisp-mode-hook
		c-mode-common-hook)
	      'yas/minor-mode-on)

(setq yas/also-auto-indent-first-line t)

;;(yas/global-mode 1)



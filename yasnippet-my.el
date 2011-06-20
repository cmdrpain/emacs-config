(require 'yasnippet)

(yas/global-mode 1)

(setq yas/prompt-functions '(yas/dropdown-prompt))
(setq yas/wrap-around-region 'cua)
(yas/load-directory  (concat lisp-dir "pkgs/snippets"))


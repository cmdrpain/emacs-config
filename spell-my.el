;; since flyspell-babel recognizes the language
;; by \usepackage[german,english]{babel}
;; and i don't even use that, just
;; \usepackage[plmath]{polski} and
;; have a master file which uses \input to include
;; other files, this is basically useless
;; (require 'ispell-multi)
;; (autoload 'flyspell-babel-setup "flyspell-babel")
;; (add-hook 'LaTeX-mode-hook 'flyspell-babel-setup)

(setq ispell-program-name "aspell")
(setq ispell-extra-args '("--sug-mode=normal" "--dont-tex-check-comments"))
(setq flyspell-issue-message-flag nil)
(setq flyspell-sort-corrections nil)
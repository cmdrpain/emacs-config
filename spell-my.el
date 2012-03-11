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

(autoload 'wcheck-mode "wcheck-mode"
  "Toggle wcheck-mode." t)
(autoload 'wcheck-change-language "wcheck-mode"
  "Switch wcheck-mode languages." t)
(autoload 'wcheck-spelling-suggestions "wcheck-mode"
  "Spelling suggestions." t)

(setq-default
 wcheck-language "Polish"
 wcheck-language-data '(("Polish"
			 (program . "/usr/bin/aspell")
			 (args . ("-l" "-d" "pl"))
			 (suggestion-program . "/usr/bin/aspell")
			 (suggestion-args . ("-a" "-d" "pl"))
			 (suggestion-parser
			  . wcheck-parse-suggestions-ispell))))
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
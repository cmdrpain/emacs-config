;;;_#38 eclipse constraint programming language
;;(require 'eclipse)
;;(require 'prolog)
;; (autoload 'prolog-mode "prolog" "Major mode for editing Prolog programs." t)
(setq prolog-system 'eclipse)
(setq prolog-program-name "eclipse-clp")
(add-to-list 'auto-mode-alist '("\\.pl" . prolog-mode))
(add-to-list 'auto-mode-alist '("\\.ecl" . prolog-mode))

;; (autoload 'eclipse-mode "eclipse.el" "ECLiPSe editing mode" t)
;; (autoload 'eclipse-esp-mode "eclipse.el" "ECLiPSe-ESP editing mode" t)
;; (add-to-list 'auto-mode-alist '("\\.ecl" . eclipse-mode))
;; (add-to-list 'auto-mode-alist '("\\.eslp" . eclipse-esp-mode))

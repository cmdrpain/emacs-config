(require 'autopair)
;; (autopair-global-mode 1) ;; to enable in all buffers
;; (add-hook 'lisp-mode-hook
;; 	  #'(lambda () (setq autopair-dont-activate t)))
;; (add-hook 'slime-repl-mode-hook
;;  	  #'(lambda () (setq autopair-dont-activate t)))

(add-hook 'c-mode-common-hook 'autopair-mode)



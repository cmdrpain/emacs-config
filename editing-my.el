(require 'expand-region)
(global-set-key (kbd "C-@") 'er/expand-region)

(require 'find-things-fast)

;; (global-set-key "f2\f" 'ftf-find-file)
;; (global-set-key '[f2] 'ftf-grepsource)
;; (global-set-key '[f4] 'ftf-gdb)
;; (global-set-key '[f5] 'ftf-compile)

(require 'ace-jump-mode)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
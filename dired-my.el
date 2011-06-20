(require 'dired-isearch)
(require 'dired-sort-map)
(eval-after-load "dired" '(require 'dired+))

(add-hook
 'dired-mode-hook
 #'(lambda ()
     ;; (toggle-dired-find-file-reuse-dir 1)  
     (local-set-key (kbd "C-s") 'dired-isearch-forward)
     (local-set-key (kbd "C-r") 'dired-isearch-backward)
     (local-set-key (kbd "ESC C-s") 'dired-isearch-forward-regexp)
     (local-set-key (kbd "ESC C-r") 'dired-isearch-backward-regexp)
     ))

(setq dired-recursive-deletes 1
      dired-recursive-copies 1
      dired-listing-switches "-lha")

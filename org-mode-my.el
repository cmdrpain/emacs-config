(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-log-done t)
(setq org-agenda-files (list  "~/org/poli.org" 
                              "~/org/linux.org"
			      "~/dane/poli/dyplom/todo.org"))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)


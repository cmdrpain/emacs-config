;;(setq desktop-restore-eager t)
(setq desktop-load-locked-desktop t)
(setq desktop-base-file-name "~/.emacs.d/.emacs.desktop")
(desktop-read)
(setq desktop-save t)
(setq desktop-dirname emacs-dir)
(desktop-save-mode 1)
(add-to-list 'desktop-modes-not-to-save 'tramp-mode)


(setq desktop-load-locked-desktop t)
;; (setq desktop-files-not-to-save "^$")
(setq desktop-base-file-name "~/.emacs.d/.emacs.desktop")
(desktop-read)
(setq desktop-save t)
(setq desktop-dirname emacs-dir)
(desktop-save-mode 1)
(add-to-list 'desktop-modes-not-to-save 'tramp-mode)

(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

;;; recentf
(require 'recentf)
;;; needed to remove tramp asking for a password unnecessarily (e.g. at startup)
(setq recentf-auto-cleanup 'never)
(setq recentf-filters)
(setq recentf-save-file (concat emacs-dir "recentf"))
(setq recentf-keep '(file-remote-p file-readable-p))
(recentf-mode 1)

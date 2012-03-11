;;; Emacs backup file configuration


;; turn off backup files for tramp mode
(add-to-list 'backup-directory-alist
	     (cons tramp-file-name-regexp nil))

;; (setq starttls-use-gnutls t)
;; (setq starttls-gnutls-program "gnutls-cli")
;; (setq starttls-extra-arguments nil)

(make-variable-buffer-local 'backup-inhibited)

(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.emacs.d/backup/"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 5
 kept-old-versions 5
 version-control t)

(require 'pick-backup)


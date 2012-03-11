(require 'anything)
(require 'anything-config)
(require 'anything-ack)
;; ;;(require 'anything-grep)
;; (setq anything-idle-delay 0.3)
(setq anything-input-idle-delay 0)
;; (setq anything-candidate-number-limit 100)

(define-key anything-map "\M-[" 'anything-previous-page)
(define-key anything-map "\M-]" 'anything-next-page)
(global-set-key (kbd "S-SPC") 'anything)

(defun my-anything-imenu ()
  (interactive)
  (anything-other-buffer
   '(anything-c-source-imenu)
   " *my-anything*"))

(defalias 'aff 'anything-for-files)

(define-key emacs-lisp-mode-map (kbd "M-<tab>") 'anything-imenu)
;; (define-key pkgbuild-mode-map (kbd "M-<tab>") 'anything-imenu)

(eval-after-load 'slime
  '(define-key slime-mode-map (kbd "M-<tab>") 'anything-imenu))



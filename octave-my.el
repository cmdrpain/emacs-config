;; (require 'ac-octave)

;; (defun ac-octave-mode-setup ()
;;   (setq ac-sources '(ac-source-octave)))
;; (add-hook 'octave-mode-hook
;; 	  '(lambda () (ac-octave-mode-setup)))

(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))

(require 'octave-mod)
(require 'octave-inf)



(eval-after-load "auto-complete"
  (eval-after-load "autopair"
    (progn
      '(add-to-list 'ac-modes 'octave-mode)
      '(add-hook 'octave-mode-hook
		 #'(lambda ()
		     (auto-fill-mode t)
		     (autopair-mode t)
		     (push '(?' . ?')
			   (getf autopair-extra-pairs :code))
		     (subword-mode t)))
      '(add-hook 'inferior-octave-mode-hook
		 #'(lambda ()
		     (autopair-mode t)
		     (subword-mode t)
		     (push '(?' . ?')
			   (getf autopair-extra-pairs :code)))))))



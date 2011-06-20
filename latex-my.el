(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

(setq TeX-auto-save t
      TeX-parse-self t
      TeX-maoster nil)



(eval-after-load "tex"
  '(progn
     (add-to-list 'TeX-command-list
		  '("MakePDF" "latexcompile.sh -d . -f %t" TeX-run-shell nil t) t)
     (add-to-list 'TeX-command-list
		  '("Activate output" "wmctrl -a master.pdf" TeX-run-shell nil t) t)
     (add-to-list 'TeX-expand-list
		  '("%u" okular-make-url) t)
     (TeX-global-PDF-mode 1)
;;; for SyncTex
     (setq TeX-source-correlate-method 'synctex)
     (TeX-source-correlate-mode t)
     (setq TeX-check-path nil)
     ))


(defun okular-make-url ()
  (concat
   ;; "file://"
   (expand-file-name (funcall file (TeX-output-extension) t)
		     (file-name-directory (TeX-master-file)))
   "#src:"
   (TeX-current-line)
   ()
   (TeX-current-file-name-master-relative)))

(add-hook 'TeX-mode-hook
          '(lambda ()
	     (define-key TeX-mode-map (kbd "<f9>")
	       (lambda ()
		 (interactive)
		 (save-buffer)
		 (TeX-command-menu "MakePDF")
		 ;; (TeX-clean)
		 ))
	     (define-key TeX-mode-map (kbd "<f12>")
	       (lambda ()
		 (interactive)
		 (TeX-view)
		 (TeX-command-menu "Activate output")
		 [return]))))

(setq TeX-view-program-list '(("Okular" "okular --unique %u")))

(setq TeX-view-program-selection '((output-pdf "Okular")))
;; (setq TeX-view-program-list
;;       '(("Okular"
;; 	("okular"
;; 	 (mode-io-correlate " --unique %o#src:%n%b")
;; 	 ""))))
;;(require 'tex)
;;(require 'url)
;; (autoload 'cdlatex-mode "cdlatex" "CDLaTeX Mode" t)
;; (autoload 'turn-on-cdlatex "cdlatex" "CDLaTeX Mode" nil)

(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;; (add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; AUCTeX LaTeX mode
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
(add-hook 'latex-mode-hook 'turn-on-reftex)   ; Emacs latex mode
(setq reftex-plug-into-AUCTeX t)


;; (eval-after-load "cdlatex-mode"
;;   '(define-key cdlatex-mode-map [(tab)] 'cdlatex-tab))

(add-hook 'LaTeX-mode-hook
	  #'(lambda () (progn
			 (local-set-key [(f11)] #'(lambda () (interactive) (flyspell-buffer)))
			 (local-set-key "\M-n" 'flyspell-goto-next-error)
			 (setq ispell-parser 'tex)
			;; (local-set-key [(meta tab)] 'TeX-complete-symbol)
			)))

(defun my-reftex-toc-mode-hook ()
  (local-set-key "\M-n" #'(lambda ()
			    (interactive)
			    (progn
			      (reftex-toc-next)
			      (reftex-toc-view-line))))
  (local-set-key "\M-p" #'(lambda ()
			    (interactive)
			    (progn
			      (reftex-toc-previous)
			      (reftex-toc-view-line)))))

(add-hook 'reftex-toc-mode-hook 'my-reftex-toc-mode-hook)

;;; default
;; (setq TeX-view-style '(("^\\(?:a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4\\)$" "%(o?)xdvi %dS -paper a4 %d")
;; 		      ("^\\(?:a5\\(?:comb\\|paper\\)\\)$" "%(o?)xdvi %dS -paper a5 %d")
;; 		      ("^b5paper$" "%(o?)xdvi %dS -paper b5 %d")
;; 		      ("^letterpaper$" "%(o?)xdvi %dS -paper us %d")
;; 		      ("^legalpaper$" "%(o?)xdvi %dS -paper legal %d")
;; 		      ("^executivepaper$" "%(o?)xdvi %dS -paper 7.25x10.5in %d")
;; 		      ("^landscape$" "%(o?)xdvi %dS -paper a4r -s 0 %d")
;; 		      ("." "%(o?)xdvi %dS %d")) )


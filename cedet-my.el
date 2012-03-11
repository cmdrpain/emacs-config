
(setq semantic-load-turn-useful-things-on t)

(setq srecode-insert-ask-variable-method 'field
      semanticdb-find-default-throttle '(project unloaded system)
      semantic-idle-scheduler-no-working-message nil
      semantic-idle-scheduler-verbose-flag nil
      semantic-idle-scheduler-idle-time 2
      semantic-idle-scheduler-work-idle-time 100
      semantic-idle-work-parse-neighboring-files-flag nil)

 (load-file (concat pkg-dir "cedet/common/cedet.el"))

(require 'semantic-ia)
(require 'semantic-gcc)
(require 'eassist)

(global-ede-mode 1)
(semantic-load-enable-gaudy-code-helpers)

(global-semantic-tag-folding-mode 1)
(global-semantic-idle-summary-mode -1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-idle-completions-mode -1)


(setq qt4-base-dir "/usr/include/Qt")
(add-to-list 'auto-mode-alist (cons qt4-base-dir 'c++-mode))
;;(semantic-add-system-include qt4-base-dir 'c++-mode)
;;(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt4-base-dir "/Qt/qconfig.h"))
;;(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt4-base-dir "/Qt/qconfig-dist.h"))
;;(add-to-list 'semantic-lex-c-preprocessor-symbol-file
;;	       (concat qt4-base-dir "/Qt/qglobal.h"))
;; (let ((basepath "/usr/include/"))
;;   (dolist (elt '("Qt" "Qtgui" "QtCore" "qwt"))
;;     (semantic-add-system-include (concat basepath elt) 'c++-mode)))


(defun my-cedet-mode-hook ()
  (srecode-minor-mode 1)
  ;; (ede-minor-mode 1)
  ;; (semantic-tag-folding-mode 1)
  ;; (semantic-idle-scheduler-mode 1)
  ;; (semantic-idle-summary-mode nil)
  ;; (semantic-idle-completions-mode nil)
  )

(dolist (elt
	 '((anything-imenu . [(meta tab)])
	   (semantic-ia-complete-symbol-menu . [(control \;)])
	   (semantic-ia-show-summary . [(meta shift return)])
	   ;; (semantic-ia-show-doc . [(shift return)])
	   (semantic-symref . [(control \')])
	   (senator-previous-tag . [(meta p)])
	   (senator-next-tag . [(meta n)])
	   (semantic-ia-complete-symbol . [(control return)])
	   (semantic-tag-folding-show-children . "\C-vs")
	   (semantic-tag-folding-show-children . "\C-v\C-s")
	   (semantic-tag-folding-show-all . "\C-vS")
	   (semantic-tag-folding-fold-children . "\C-vh")
	   (semantic-tag-folding-fold-children . "\C-v\C-h")
	   (semantic-tag-folding-fold-all . "\C-vH")))
  (define-key senator-mode-map (cdr elt) (car elt)))


(mapcar #'(lambda (mode) (add-hook mode 'my-cedet-mode-hook))
	'(c-mode-common-hook emacs-lisp-mode-hook))


;;; Don't load semantic in the following modes/buffers:
(add-hook 'semantic-inhibit-functions
	  '(lambda ()
	     (or (string-match "*scratch*" (buffer-name))
		 (string-match "Slime" (prin1-to-string major-mode))
		 (string-match "Lisp" (prin1-to-string major-mode))
		 (string-match "python-mode" (prin1-to-string major-mode)))))

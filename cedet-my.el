 (load-file (concat pkg-dir "cedet/common/cedet.el"))
;; (require 'srecode-load)
;; (require 'srecode-cpp)
;;(semantic-load-enable-excessive-code-helpers)
;; (require 'semanticdb-global)
;; (semantic-load-enable-semantic-debugging-helpers)
;;  (global-semantic-idle-completions-mode)
;; (global-semantic-idle-tag-highlight-mode t)


(require 'semantic-ia)
(require 'semantic-gcc)
(require 'eassist)



(global-ede-mode t)
(global-semantic-tag-folding-mode 1)
;; (global-semantic-idle-summary-mode 1)
(global-semantic-idle-scheduler-mode 1)
(semantic-load-enable-gaudy-code-helpers)

(setq srecode-insert-ask-variable-method 'field)
(setq semanticdb-find-default-throttle '(project unloaded system))

(setq semantic-idle-scheduler-no-working-message t)
(setq semantic-idle-scheduler-verbose-flag nil)
(setq semantic-idle-scheduler-idle-time 2)
(setq semantic-idle-scheduler-work-idle-time 10)
(setq semantic-idle-work-parse-neighboring-files-flag nil)


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
  (local-set-key [(meta tab)] 'eassist-list-methods)
  (local-set-key [(control \;)] 'semantic-ia-complete-symbol-menu)
  ;; (local-set-key [(meta return)] 'semantic-analyze-proto-impl-toggle)
  (local-set-key [(meta shift return)] 'semantic-ia-show-summary)
  (local-set-key [(shift return)] 'semantic-ia-show-doc)
  (local-set-key [(control \')] 'semantic-symref)
  (local-set-key [(meta p)] 'senator-previous-tag)
  (local-set-key [(meta n)] 'senator-next-tag)
  ;; (semantic-new-buffer-fcn)
  ;; (ede-minor-mode 1)
  ;; (semantic-idle-summary-mode 1)
  ;; (semantic-idle-scheduler-mode 1)
  ;; (semantic-tag-folding-mode 1)
  ;; (semantic-load-enable-gaudy-code-helpers)
  )

(mapcar #'(lambda (mode) (add-hook mode 'my-cedet-mode-hook))
	'(c-mode-common-hook emacs-lisp-mode-hook matlab-mode-hook))


;;; Don't load semantic in the following modes/buffers:
(add-hook 'semantic-inhibit-functions
	  '(lambda ()
	     (or (string-match "Lisp" (prin1-to-string major-mode))
		 (string-match "python-mode" (prin1-to-string major-mode)))))

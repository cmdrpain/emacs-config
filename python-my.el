;; (require 'ipython)
;; (add-to-list 'auto-mode-alist '("\\.py$" . ipython))
;; (add-to-list 'interpreter-mode-alist '("python" . ipython))
;; (autoload 'python-mode "python-mode" "Python editing mode." t)
;; (autoload 'python "python" "Python editing mode." t)

;; (setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
;; (setq interpreter-mode-alist (cons '("python" . python-mode)
;; 				   interpreter-mode-alist))
;; (autoload 'python-mode "python-mode" "Python editing mode." t)

(defun my-python-documentation (w)
  "Launch PyDOC on the Word at Point"
  (interactive
   (list (let* ((word (thing-at-point 'word))
		(input (read-string 
			(format "pydoc entry%s: " 
				(if (not word) "" (format " (default %s)" word))))))
	   (if (string= input "") 
	       (if (not word) (error "No pydoc args given")
		 word)			;sinon word
	     input))))			;sinon input
  (shell-command (concat "/usr/bin/python" " -c \"from pydoc import help;help(\'" w "\')\" ") "*PYDOCS*") ;
  (view-buffer-other-window "*PYDOCS*" t 'kill-buffer-and-window))

;; (load-file (concat pkg-dir "emacs-for-python/epy-init.el"))


;;(define-key python-mode-map [(control c)(d)(d)] 'my-python-documentation)


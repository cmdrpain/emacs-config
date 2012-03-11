(defvar isearch-initial-string nil)

(defun isearch-set-initial-string ()
  (remove-hook 'isearch-mode-hook 'isearch-set-initial-string)
  (setq isearch-string isearch-initial-string)
  (isearch-search-and-update))

(defun isearch-forward-at-point (&optional regexp-p no-recursive-edit)
  "Interactive search forward for the symbol at point."
  (interactive "P\np")
  (if regexp-p (isearch-forward regexp-p no-recursive-edit)
    (let* ((end (progn (skip-syntax-forward "w_") (point)))
           (begin (progn (skip-syntax-backward "w_") (point))))
      (if (eq begin end)
          (isearch-forward regexp-p no-recursive-edit)
        (setq isearch-initial-string (buffer-substring begin end))
        (add-hook 'isearch-mode-hook 'isearch-set-initial-string)
        (isearch-forward regexp-p no-recursive-edit)))))

(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer nil))

(defun other-window-backward (n)
  "Select Nth previous window."
  (interactive "p")
  (other-window (- n)))

;;; This is a piece of code from JorgenSchaefersEmacsConfig - see emacswiki
(defun insert-date (prefix)
  "Insert the current date. With prefix-argument, use ISO format. With
   two prefix arguments, write out the day and month name."
  (interactive "P")
  (let ((format (cond
		 ((not prefix) "%d.%m.%Y")
		 ((equal prefix '(4)) "%Y-%m-%d")
		 ((equal prefix '(16)) "%A, %d. %B %Y")
		 ((equal prefix '1) "%Y%m%d")))
	(system-time-locale "de_DE"))
    (insert (format-time-string format))))

(defun reload-emacs-config ()
  (interactive)
  ;;  (desktop-save "~/")
  (eval-buffer ".emacs"))

(defun indent-whole-buffer ()
  (interactive)
  (indent-region (point-min) (point-max) nil))

(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (message "Copied line")
     (list (line-beginning-position)
	   (line-beginning-position 2)))))

(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
	   (line-beginning-position 2)))))

(defadvice yank (before slick-copy activate)
  "Position point when yanking lines."
  (let ((kill (current-kill 0 t)))
    (when (eq ?\n (elt kill (1- (length kill))))
      (beginning-of-line))))


(defun my-add-hooks (hook-list hook)
  "Add HOOK to modes in HOOK-LIST."
  (dolist (elt hook-list)
    (add-hook elt hook)))

(defmacro eval-if-featurep (feature-list warn err &rest body)
  "Eval BODY if all features in quoted FEATURE-LIST is present, otherwise
issue warn if WARN is non-nil or error if
ERR is non-nil. ERR takes precedence if both are non-nil."
  (let ((elt (make-symbol "elt"))
	(ok (make-symbol "ok")))
    `(let ((,ok t))
       (dolist (,elt ,feature-list)
	 (unless (featurep ,elt)
	   (cond (,err (error "Package %s is not available" ,elt))
		 (,warn (warn "Package %s is not available" ,elt)))
	   (setq ,ok nil)))
       (when ,ok
	 (progn
	   ,@body)))))


;; (defun dired-highlight-dirs-ucs-code-point ()
;;   (interactive)
;;   (unless (string= "dired-mode" (symbol-name major-mode))
;;     (error "Must be a dired buffer"))
;;   (let ((file-list (directory-files (dired-current-directory) t nil t))
;; 	(repl-alist '(("008c" . "\n#include") ("0094" . "APTR")))
;; 	(rpl 0)
;; 	(buffer)
;; 	(index)
;; 	(index-list))
;;     (dolist (file file-list)
;;       (catch 'continue
;; 	(if (file-regular-p file)
;; 	    (find-file file)
;; 	   (throw 'continue nil))
;; 	(setq buffer (buffer-string))
;; 	(setq index (find (string-to-number (car (nth rpl repl-alist)) 16) buffer))
;; 	(push index index-list)
;; 	(while index
;; 	  (setq index (find (string-to-number (car (nth rpl repl-alist)) 16) buffer))
;; 	  (push index index-list)
;; 	  (setq buffer (delete (elt buffer index) buffer)))
;; 	(nreverse index-list)
;; 	(kill-region-new (point-min) (point-max))
;; 	(insert buffer)
;; 	(save-buffer)
;;        (unless (string= "dired-mode" (symbol-name major-mode))
;; 	 (kill-buffer))))
;;     ;; (dolist (el mark-list)
;;     ;;   (print (car el)))
;;     ))


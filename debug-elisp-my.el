(defadvice message (before who-said-that activate)
  "Find out who said that thing. and say so."
  (let ((trace nil) (n 1) (frame nil))
    (while (setq frame (backtrace-frame n))
      (setq n     (1+ n) 
	    trace (cons (cadr frame) trace)) )
    (ad-set-arg 0 (concat "<<%S>>:\n" (ad-get-arg 0)))
    (ad-set-args 1 (cons trace (ad-get-args 1))) ))

(ad-disable-advice 'message 'before 'who-said-that)
(ad-update 'message)

(defun my-activate-debug-who-msgs ()
  (interactive)
  (ad-enable-advice 'message 'before 'who-said-that)
  (ad-update 'message))

(defun my-deactivate-debug-who-msgs ()
  (interactive)
  (ad-disable-advice 'message 'before 'who-said-that)
  (ad-update 'message))



(defadvice message (before when-was-that activate)
  "Add timestamps to `message' output."
  (ad-set-arg 0 (concat (format-time-string "[%Y-%m-%d %T %Z] ") 
			(ad-get-arg 0)) ))


(defun my-activate-debug-when-msgs ()
  (interactive)
  (ad-enable-advice 'message 'before 'when-was-that)
  (ad-update 'message))

(defun my-deactivate-debug-when-msgs ()
  (interactive)
  (ad-disable-advice 'message 'before 'when-was-that)
  (ad-update 'message))

(ad-disable-advice 'message 'before 'when-was-that)
(ad-update 'message)

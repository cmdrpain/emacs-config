
(add-hook 'after-save-hook
	  #'(lambda ()
	      (and (save-excursion
		     (save-restriction
		       (widen)
		       (goto-char (point-min))
		       (save-match-data
			 (looking-at "^#!"))))
		   (not (file-executable-p (shell-quote-argument buffer-file-name)))
		   (shell-command (concat "chmod u+x " buffer-file-name))
		   (message
		    (concat "Saved as script: " buffer-file-name)))))

(add-hook 'text-mode-hook 'turn-on-orgtbl)
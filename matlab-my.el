;; (setq matlab-indent-function t
;;       matlab-shell-command "matlab")
(load-library "matlab-load")
;;(matlab-cedet-setup)
(setq matlab-shell-command "matlab77")

(eval-after-load "matlab"
  '(setq matlab-shell-command-switches '("-nosplash" "-nodesktop")))


(defun my-matlab-mode-hook ()
  (set-fill-column 80)
  (local-set-key "\M-;" 'comment-dwim)
  (local-set-key "\C-c//" 'srecode-insert)
  (linum-mode 1))

(add-hook 'matlab-mode-hook 'my-matlab-mode-hook)


(require 'workgroups)
(setq wg-prefix-key (kbd "C-z"))
(workgroups-mode 1)
(defvar wg-save-file (concat emacs-dir "workgroups")
  "File where `workgroups' stores it's configuration")
(wg-load wg-save-file)


(add-hook 'kill-emacs-hook 'wg-update-all-workgroups-and-save)
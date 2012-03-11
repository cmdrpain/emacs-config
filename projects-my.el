(require 'mk-project)

(global-set-key (kbd "C-c p c") 'project-compile)
(global-set-key (kbd "C-c p l") 'project-load)
(global-set-key (kbd "C-c p a") 'project-ack)
(global-set-key (kbd "C-c p g") 'project-grep)
(global-set-key (kbd "C-c p o") 'project-multi-occur)
(global-set-key (kbd "C-c p u") 'project-unload)
(global-set-key (kbd "C-c p f") 'project-find-file) ; or project-find-file-ido
(global-set-key (kbd "C-c p i") 'project-index)
(global-set-key (kbd "C-c p s") 'project-status)
(global-set-key (kbd "C-c p h") 'project-home)
(global-set-key (kbd "C-c p d") 'project-dired)
(global-set-key (kbd "C-c p t") 'project-tags)


(defvar proj-basedir (concat emacs-dir "proj/")
  "Base directory used to store mk-project stuff, i.e.
TAGS-FILE, FILE-LIST-CACHE, OPEN-FILES-CACHE.")

;;; project definitions

(let* ((name "emacs-core")
       (basedir (concat proj-basedir name)))
  (project-def name
	       `((basedir          "~/dev/emacs/emacs-23.3/src/")
		 (src-patterns     ("*.c" "*.h"))
		 (ignore-patterns  ("*.el" "*.elc"))
		 (tags-file        ,(concat basedir "/tags"))
		 (file-list-cache  ,(concat basedir "/files"))
		 (open-files-cache ,(concat basedir "/open-files"))
		 (vcs              git)
		 (compile-cmd      "make")
		 (ack-args         "")
		 (startup-hook     nil)
		 (shutdown-hook    nil))))


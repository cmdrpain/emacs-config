;;Time-stamp: <2009-03-12 21:50:37 andy>
(require 'cl)
;;; Global variables
(setq home-dir "/home/andy/")
(setq lisp-dir (concat home-dir "elisp/"))
(setq pkg-dir (concat lisp-dir "pkgs/"))
(setq mylisp-dir (concat lisp-dir "mylisp/"))
(setq emacs-dir (concat home-dir ".emacs.d/"))
(setq elpa-dir (concat emacs-dir "elpa/"))
(setq site-lisp-dir "/usr/share/emacs/site-lisp/")

;;; We don't want to miss important startup messages
(setq message-log-max 5000)


;;; safe file local variables
(setq enable-local-variables t)
(setq safe-local-variable-values
      '((ispell-dictionary . "polish")
	(mode . latex)
	(TeX-master . t)
	(TeX-master . "master")))

;;; Turn off nagging/unneded things
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; Make all yes/no prompts y/n instead
(fset 'yes-or-no-p 'y-or-n-p)

;; No blinking cursor
(blink-cursor-mode nil)

;; No startup message for me
(setq inhibit-startup-message t)
(blink-cursor-mode 0)
(tooltip-mode -1)
(tool-bar-mode -1)

;;; NO TABS
;;; http://www.jwz.org/doc/tabs-vs-spaces.html
(setq indent-tabs-mode nil)

(put 'narrow-to-page 'disabled nil)

(setq history-length 250)

;; Changes the way emacs scrolls. When you get past the top or bottom of the
;; screen emacs at default scrolls half a screen and centers your text cursor.
;; With this emacs scrolls one line at a time.

(setq scroll-step 1
      scroll-conservatively 10000)

;; Use the x-clipboard
(setq x-select-enable-clipboard t)
(iswitchb-mode 1)
;;(global-pair-mode 1) ;; gives me trouble with cc-mode

;;; disable vc (version control)
(setq vc-handled-backends nil)

(setq modelinepos-column-limit 79)
(prefer-coding-system 'utf-8)
(set-language-environment 'UTF-8)
;;(setq file-name-coding-system 'UTF-8)

(defun my-add-contents-to-load-path (dir)
  "Add subdirs of DIR to load-path"
  (let ((dir-list (directory-files dir t nil t)))
    (dolist (file dir-list)
      (if (and (file-accessible-directory-p file)
	       (not (string-match-p "\\.\\|\\.\\.\\|CVS" file)))
	  (add-to-list 'load-path file)))))

(add-to-list 'load-path lisp-dir)
(add-to-list 'load-path (concat site-lisp-dir "auctex/"))
(defun my-update-load-path ()
  (interactive)
  (my-add-contents-to-load-path pkg-dir))

(my-update-load-path)

;;; elpa

(if (not (boundp 'package-archives))
    (setq package-archives nil))

(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/")
	     '("gnu" . "http://elpa.gnu.org/"))

(when
     (load
      (expand-file-name  (concat elpa-dir "package.el")))
   (package-initialize))

;;; reset the info search path, since this fucks up my dir node
(setq Info-directory-list '("/usr/share/info"))

(require 'info+)
(require 'moccur-edit)
(require 'color-moccur)
(require 'color-occur)
(require 'incr)
(require 'iedit)
(require 'magit)

;;; load my customizations
(flet ((load-file (x) (load (concat mylisp-dir x))))
    (load-file "common-my")
    (load-file "backup-my")
    (load-file "editing-my")
    ;; should be before cc-mode, as it require mic-paren
    (load-file "visuals-my")
    ;; (load-file "company-my")
    (load-file "yasnippet-my")
    (load-file "autocomplete-my")
    (load-file "autopair-my")
    (load-file "anything-my")
    ;; this doesn't work too good yet. I need to investigate some
    ;; surprising behaviour
   ;; (load-file "autoindent-my")
    (load-file "cc-mode-my")
    (load-file "lacarte-my")
    ;; doesn't work: prints "Process is not running for buffer "
    ;; (load-file "wcheck-mode-my")
    (load-file "cedet-my")
    (load-file "cmake-my")
    (load-file "cut-paste-my")
    (load-file "dired-my")
    (load-file "icicles-my")
    (load-file "latex-my")
    (load-file "octave-my")
    ;; (load-file "matlab-my")
    (load-file "session-my")
    (load-file "paredit-my")
    (load-file "screen-my")
    (load-file "slime-my")
    (load-file "uniquify-my")
    (load-file "woman-my")
    (load-file "elisp-my")
    ;; (load-file "python-my")
    (load-file "projects-my")
    (load-file "window-management-my")
    (load-file "org-mode-my")
    (load-file "global-hooks-my")
    (load-file "global-keys-my"))

;;; workaround to some bug
(setq warning-suppress-types nil)

;;; ack
(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(setq ack-prompt-for-directory t)
;;; way too slow
;; (autoload 'ack-find-same-file "full-ack" nil t)
;; (autoload 'ack-find-file "full-ack" nil t)


;;; browsing
(setq browse-url-browser-function 'browse-url-firefox
      browse-url-firefox-new-window-is-tab t)

;;; findr
(autoload 'findr "findr" "Find file name." t)
(autoload 'findr-search "findr" "Find text in files." t)
(autoload 'findr-query-replace "findr" "Replace text in files." t)

;;; gnuplot
(autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
(autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)
(add-to-list 'auto-mode-alist '("\\.gp$" . gnuplot-mode))


;;; keyfreq
(require 'keyfreq)
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

;;; lua
(autoload 'lua-mode "lua-mode" "Lua major mode")
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(eval-after-load "lua-mode" '(load "flymakelua.el"))

;;; doxymacs
;; (require 'doxymacs)
;; (defun my-doxymacs-font-lock-hook ()
;;   (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
;;       (doxymacs-font-lock)))
;; (add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)

;;; mode-compile - wrapper around compile
;;; doesn't really work as fine as it should
;; (autoload 'mode-compile "mode-compile"
;;   "Command to compile current buffer file based on the major mode" t)
;; (autoload 'mode-compile-kill "mode-compile"
;;   "Command to kill a compilation launched by `mode-compile'" t)
;; (global-set-key "\C-ck" 'mode-compile-kill)

;;; popwin - makes annoying pop-up buffers less annoying
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

;;; pkgbuild-mode
(autoload 'pkgbuild-mode "pkgbuild-mode" "PKGBUILD mode." t)
(add-to-list 'auto-mode-alist '("/PKGBUILD$" . pkgbuild-mode))

;;; shell
(add-to-list 'auto-mode-alist '("/etc/profile" . shell-script-mode))

;;; switch-window
(require 'switch-window)

;;; view-mode
(define-key view-mode-map "q" 'bury-buffer)


;;; wesnoth mode
(autoload 'wesnoth-mode "wesnoth-mode" "Major mode for editing WML." t)
(add-to-list 'auto-mode-alist '("\\.cfg\\'" . wesnoth-mode))

(autoload 'kill-ring-search "kill-ring-search"
  "Search the kill ring in the minibuffer.")


(server-start)


;;;_ EDE projects
;; (ede-cpp-root-project "pss"
;; 		      :file "~/dane/poli/pss/project/CMakeLists.txt"
;; 		      :system-include-path
;; 		      '( "/usr/include/Qt" "/usr/include/boost" "usr/include/qwt")
;; 		      :spp-table
;; 		      '(("Q_OBJECT" . "")
;; 			("signals:" . "")))

(if (fboundp 'ede-version)
    (eval-after-load "ede-cpp-root"
      (ignore-errors
	  (progn
	    (setq golem-prefix "~/downloads/amiga/amikit-good/Work/")
	    (ede-cpp-root-project "golem"
				  :file (concat golem-prefix "golem/smakefile")
				  :include-path '(".")
				  :system-include-path (list
							(concat golem-prefix "sc/include")
							(concat golem-prefix "include/"))
				  :spp-table '( ("STATIC" . "static")
						("CONST" . "const")
						("VOID" . "void")
						("GLOBAL" . "extern")
						("IMPORT" . "extern")
						("REGISTER" . "register")
						)
				  :spp-files
				  '("golem_macros.h" "golem_dirs.h" "golem_strings.h" "golem.h")
				  )))))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((Syntax . Common-Lisp) (Package . CL-UNICODE) (Base . 10) (Package . CL-PPCRE) (Syntax . COMMON-LISP) (ispell-dictionary . "polish") (mode . latex) (TeX-master . t) (TeX-master . "master")))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

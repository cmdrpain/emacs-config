;;Time-stamp: <2009-03-12 21:50:37 andy>

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

;;; recentf
(require 'recentf)
;;; needed to remove tramp asking for a password unnecessarily (e.g. at startup)
(setq recentf-auto-cleanup 'never)
(recentf-mode 1)

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
;; Don't add mylisp-dir to load-path
;; (add-to-list 'load-path mylisp-dir)
(my-add-contents-to-load-path elpa-dir)
(my-add-contents-to-load-path pkg-dir)
;; (my-add-contents-to-load-path (concat pkg-dir "cedet"))


;;; elpa
 (when
     (load
      (expand-file-name  (concat elpa-dir "package.el")))
   (package-initialize))

(if (not (boundp 'package-archives))
    (setq package-archives nil))

(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))

;;; reset the info search path, since this fucks up my dir node
(setq Info-directory-list '("/usr/share/info"))

(require 'info+)

(require 'moccur-edit)
(require 'color-moccur)
(require 'incr)
(require 'iedit)
(require 'magit)
(require 'fill-column-indicator)
(set-fill-column 80)
(setq fci-style 'rule)
;;; load my customizations
(flet ((load-file (x) (load (concat mylisp-dir x))))
    (load-file "backup-my")
    ;; should be before cc-mode, as it require mic-paren
    (load-file "visuals-my")
    (load-file "company-my")
    (load-file "cc-mode-my")
    (load-file "lacarte-my")
    ;; doesn't work: prints "Process is not running for buffer "
    ;; (load-file "wcheck-mode-my")
    ;; (load-file "cedet-my")
    (load-file "cmake-my")
    (load-file "cut-paste-my")
    (load-file "dired-my")
    (load-file "functions-my")
    (load-file "global-hooks-my")
    (load-file "global-keys-my")
    (load-file "icicles-my")
    (load-file "latex-my")
    (load-file "matlab-my")
    (load-file "paredit-my")
    (load-file "screen-my")
    (load-file "session-my")
    (load-file "slime-my")
    (load-file "uniquify-my")
    (load-file "woman-my")
    (load-file "debug-elisp-my")
    ;; (load-file "python-my")
    ;; (load-file "yasnippet-my")
    (load-file "org-mode-my")
    )


;;; workaround to some bug
(setq warning-suppress-types nil)

;;; lisp
(add-hook 'lisp-mode-hook '(lambda nil (linum-mode 1)))
(add-hook 'emacs-lisp-mode-hook '(lambda nil (eldoc-mode 1) (company-mode 1)))


;;; doxymacs
;; (require 'doxymacs)
;; (defun my-doxymacs-font-lock-hook ()
;;   (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
;;       (doxymacs-font-lock)))
;; (add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)

(global-font-lock-mode t)
;;; findr

(autoload 'findr "findr" "Find file name." t)
(autoload 'findr-search "findr" "Find text in files." t)
(autoload 'findr-query-replace "findr" "Replace text in files." t)


;;; gnuplot
(autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
(autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)
(add-to-list 'auto-mode-alist '("\\.gp$" . gnuplot-mode))

;;; pkgbuild-mode
(autoload 'pkgbuild-mode "pkgbuild-mode" "PKGBUILD mode." t)
(add-to-list 'auto-mode-alist '("/PKGBUILD$" . pkgbuild-mode))

;;; shell
(add-to-list 'auto-mode-alist '("/etc/profile" . shell-script-mode))

;;; browsing
(setq browse-url-browser-function (quote browse-url-kde))

;;; view-mode
(define-key view-mode-map "q" 'bury-buffer)

;;; lua
(autoload 'lua-mode "lua-mode" "Lua major mode")
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(eval-after-load "lua-mode" '(load "flymakelua.el"))

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
			      ))))


;;(save-buffers-kill-emacs)


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(bibtex-entry-field-alist (quote (("Article" ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the article (BibTeX converts it to lowercase)") ("journal" "Name of the journal (use string, remove braces)") ("year" "Year of publication")) (("volume" "Volume of the journal") ("number" "Number of the journal (only allowed if entry contains volume)") ("pages" "Pages in the journal") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem"))) ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the article (BibTeX converts it to lowercase)")) (("pages" "Pages in the journal") ("journal" "Name of the journal (use string, remove braces)") ("year" "Year of publication") ("volume" "Volume of the journal") ("number" "Number of the journal") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem")))) ("Book" ((("author" "Author1 [and Author2 ...] [and others]" nil t) ("editor" "Editor1 [and Editor2 ...] [and others]" nil t) ("title" "Title of the book") ("publisher" "Publishing company") ("year" "Year of publication")) (("volume" "Volume of the book in the series") ("number" "Number of the book in a small series (overwritten by volume)") ("series" "Series in which the book appeared") ("address" "Address of the publisher") ("edition" "Edition of the book as a capitalized English word") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem"))) ((("author" "Author1 [and Author2 ...] [and others]" nil t) ("editor" "Editor1 [and Editor2 ...] [and others]" nil t) ("title" "Title of the book")) (("publisher" "Publishing company") ("year" "Year of publication") ("volume" "Volume of the book in the series") ("number" "Number of the book in a small series (overwritten by volume)") ("series" "Series in which the book appeared") ("address" "Address of the publisher") ("edition" "Edition of the book as a capitalized English word") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem")))) ("Booklet" ((("title" "Title of the booklet (BibTeX converts it to lowercase)")) (("author" "Author1 [and Author2 ...] [and others]") ("howpublished" "The way in which the booklet was published") ("address" "Address of the publisher") ("month" "Month of the publication as a string (remove braces)") ("year" "Year of publication") ("note" "Remarks to be put at the end of the \\bibitem")))) ("InBook" ((("author" "Author1 [and Author2 ...] [and others]" nil t) ("editor" "Editor1 [and Editor2 ...] [and others]" nil t) ("title" "Title of the book") ("chapter" "Chapter in the book") ("publisher" "Publishing company") ("year" "Year of publication")) (("volume" "Volume of the book in the series") ("number" "Number of the book in a small series (overwritten by volume)") ("series" "Series in which the book appeared") ("type" "Word to use instead of \"chapter\"") ("address" "Address of the publisher") ("edition" "Edition of the book as a capitalized English word") ("month" "Month of the publication as a string (remove braces)") ("pages" "Pages in the book") ("note" "Remarks to be put at the end of the \\bibitem"))) ((("author" "Author1 [and Author2 ...] [and others]" nil t) ("editor" "Editor1 [and Editor2 ...] [and others]" nil t) ("title" "Title of the book") ("chapter" "Chapter in the book")) (("pages" "Pages in the book") ("publisher" "Publishing company") ("year" "Year of publication") ("volume" "Volume of the book in the series") ("number" "Number of the book in a small series (overwritten by volume)") ("series" "Series in which the book appeared") ("type" "Word to use instead of \"chapter\"") ("address" "Address of the publisher") ("edition" "Edition of the book as a capitalized English word") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem")))) ("InCollection" ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the article in book (BibTeX converts it to lowercase)") ("booktitle" "Name of the book") ("publisher" "Publishing company") ("year" "Year of publication")) (("editor" "Editor1 [and Editor2 ...] [and others]") ("volume" "Volume of the book in the series") ("number" "Number of the book in a small series (overwritten by volume)") ("series" "Series in which the book appeared") ("type" "Word to use instead of \"chapter\"") ("chapter" "Chapter in the book") ("pages" "Pages in the book") ("address" "Address of the publisher") ("edition" "Edition of the book as a capitalized English word") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem"))) ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the article in book (BibTeX converts it to lowercase)") ("booktitle" "Name of the book")) (("pages" "Pages in the book") ("publisher" "Publishing company") ("year" "Year of publication") ("editor" "Editor1 [and Editor2 ...] [and others]") ("volume" "Volume of the book in the series") ("number" "Number of the book in a small series (overwritten by volume)") ("series" "Series in which the book appeared") ("type" "Word to use instead of \"chapter\"") ("chapter" "Chapter in the book") ("address" "Address of the publisher") ("edition" "Edition of the book as a capitalized English word") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem")))) ("InProceedings" ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the article in proceedings (BibTeX converts it to lowercase)") ("booktitle" "Name of the conference proceedings") ("year" "Year of publication")) (("editor" "Editor1 [and Editor2 ...] [and others]") ("volume" "Volume of the conference proceedings in the series") ("number" "Number of the conference proceedings in a small series (overwritten by volume)") ("series" "Series in which the conference proceedings appeared") ("pages" "Pages in the conference proceedings") ("address" "Location of the Proceedings") ("month" "Month of the publication as a string (remove braces)") ("organization" "Sponsoring organization of the conference") ("publisher" "Publishing company, its location") ("note" "Remarks to be put at the end of the \\bibitem"))) ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the article in proceedings (BibTeX converts it to lowercase)")) (("booktitle" "Name of the conference proceedings") ("pages" "Pages in the conference proceedings") ("year" "Year of publication") ("editor" "Editor1 [and Editor2 ...] [and others]") ("volume" "Volume of the conference proceedings in the series") ("number" "Number of the conference proceedings in a small series (overwritten by volume)") ("series" "Series in which the conference proceedings appeared") ("address" "Location of the Proceedings") ("month" "Month of the publication as a string (remove braces)") ("organization" "Sponsoring organization of the conference") ("publisher" "Publishing company, its location") ("note" "Remarks to be put at the end of the \\bibitem")))) ("Manual" ((("title" "Title of the manual")) (("author" "Author1 [and Author2 ...] [and others]") ("organization" "Publishing organization of the manual") ("address" "Address of the organization") ("edition" "Edition of the manual as a capitalized English word") ("month" "Month of the publication as a string (remove braces)") ("year" "Year of publication") ("note" "Remarks to be put at the end of the \\bibitem")))) ("MastersThesis" ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the master's thesis (BibTeX converts it to lowercase)") ("school" "School where the master's thesis was written") ("year" "Year of publication")) (("type" "Type of the master's thesis (if other than \"Master's thesis\")") ("address" "Address of the school (if not part of field \"school\") or country") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem")))) ("Misc" (nil (("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the work (BibTeX converts it to lowercase)") ("howpublished" "The way in which the work was published") ("month" "Month of the publication as a string (remove braces)") ("year" "Year of publication") ("note" "Remarks to be put at the end of the \\bibitem")))) ("PhdThesis" ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the PhD. thesis") ("school" "School where the PhD. thesis was written") ("year" "Year of publication")) (("type" "Type of the PhD. thesis") ("address" "Address of the school (if not part of field \"school\") or country") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem")))) ("Proceedings" ((("title" "Title of the conference proceedings") ("year" "Year of publication")) (("booktitle" "Title of the proceedings for cross references") ("editor" "Editor1 [and Editor2 ...] [and others]") ("volume" "Volume of the conference proceedings in the series") ("number" "Number of the conference proceedings in a small series (overwritten by volume)") ("series" "Series in which the conference proceedings appeared") ("address" "Location of the Proceedings") ("month" "Month of the publication as a string (remove braces)") ("organization" "Sponsoring organization of the conference") ("publisher" "Publishing company, its location") ("note" "Remarks to be put at the end of the \\bibitem")))) ("TechReport" ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the technical report (BibTeX converts it to lowercase)") ("institution" "Sponsoring institution of the report") ("year" "Year of publication")) (("type" "Type of the report (if other than \"technical report\")") ("number" "Number of the technical report") ("address" "Address of the institution (if not part of field \"institution\") or country") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem")))) ("Unpublished" ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the unpublished work (BibTeX converts it to lowercase)") ("note" "Remarks to be put at the end of the \\bibitem")) (("month" "Month of the publication as a string (remove braces)") ("year" "Year of publication")))) ("online" ((("title" "Title of the online resource") ("url" "An URL to the online resource")) (("author" "Author1 [and Author2 ...] [and others]") ("editor" "") ("year" "Year of publication") ("date" "") ("subtitle" "") ("titleaddon" "") ("language" "") ("version" "") ("note" "") ("organization" "") ("month" "") ("year" "") ("addendum" "") ("pubstate" "") ("urldate" "")))))))
 '(safe-local-variable-values (quote ((Package . CL-UNICODE) (Base . 10) (Package . CL-PPCRE) (Syntax . COMMON-LISP) (ispell-dictionary . "polish") (mode . latex) (TeX-master . t) (TeX-master . "master"))))
 '(saint/iswitchb-highlight-modes-alist (quote (("Dired" . 1) ("Info" . 2) ("Fundamental" . 3) ("Completions" . 3) ("Org" . 4)))))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(magit-diff-add ((((class color) (background dark)) (:foreground "green"))))
 '(magit-diff-del ((((class color) (background light)) (:foreground "red")) (((class color) (background dark)) (:foreground "red"))))
 '(magit-diff-hunk-header ((t (:inherit magit-header :box (:line-width 1 :color "blue")))))
 '(magit-item-highlight ((((class color) (background dark)) (:background "grey12"))))
 )

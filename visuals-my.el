(require 'font-lock)
(setq-default font-lock-maximum-decoration t)
(global-font-lock-mode 1)

;; (require 'highlight-current-line)
;; (highlight-current-line-on 1)
;; (highlight-current-line-set-bg-color "gray30")

;;; use the builtin functionality
(global-hl-line-mode 1)

(setq eval-expression-print-level 10   ; default 4
      eval-expression-print-length 50) ; default 12

(setq-default show-trailing-whitespace t)
;; (setq default-indicate-empty-lines nil)

 ;; (remove-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'color-theme)
 (color-theme-initialize)
;;(color-theme-initialize) needs to be before (require 'theme-manager)
;; (require 'theme-manager)
(setq default-cursor- 'bar)
(set-frame-font "-xos4-terminus-medium-r-normal--12-*-*-*-*-*-iso10646-1")
;;(set-frame-font "DejaVu Sans Mono 8")
(setq color-theme-is-global t)
;;; current:
(eval-after-load "color-theme" '(color-theme-pok-wob))

;; (eval-after-load "color-theme" '(color-theme-dark-info))
;; (eval-after-load "color-theme" '(color-theme-oswald))

;;; seems mic-paren is maintained
(require 'mic-paren)
(paren-activate)

;; (require 'paren-mode)
;; (setq show-paren-delay 0.0)
;; (show-paren-mode nil)

;;; adds multi level paren highlight
(require 'highlight-parentheses)
;;; superseded by auto-pair
;; (require 'parenthesis)
;; (require 'pair-mode)

(require 'linum)
(defun my-turn-on-linum-mode ()
  (linum-mode t))


(my-add-hooks '(c-mode-common-hook
		lisp-mode-hook
		emacs-lisp-mode-hook
		matlab-mode-hook
		octave-mode-hook)
	      'my-turn-on-linum-mode)

(require 'modeline-posn)
(require 'iswitchb-highlight)

(which-func-mode)
(delete-selection-mode 1)
(display-time)
(column-number-mode 1)
(transient-mark-mode 1)
(global-visual-line-mode 1)
(add-hook 'minibuffer-setup-hook (lambda ()
                                   (visual-line-mode -1)))
;; (require 'fill-column-indicator)
;; (setq fci-style 'rule)


(require 'winpoint)
(window-point-remember-mode 1)


;;; auto-fill
;;(add-hook 'slime-mode-hook 'turn-on-auto-fill)
(defun my-auto-fill-hook ()
  (turn-on-auto-fill)
  (set-fill-column 79))

(my-add-hooks '(lisp-mode-hook
		emacs-lisp-mode-hook
		c-mode-common-hook)
	      'my-auto-fill-hook)


;;; pos-tip config

(require 'pos-tip)

;; (defvar my-pos-tip-shown nil
;;   "pos-tip is currently being shown")

;; (defadvice pos-tip-show (after my-pos-tip-active)
;;   (setq my-pos-tip-shown t))

;; (defadvice pos-tip-hide (after my-pos-tip-inactive)
;;   (setq my-pos-tip-shown nil))

;; (ad-activate 'pos-tip-show)
;; (ad-activate 'pos-tip-hide)

(defun my-describe-function (function)
  "Display the full documentation of FUNCTION (a symbol) in tooltip."
  (interactive (list (function-called-at-point)))
  (unless function
   (pos-tip-show
    "** You didn't specify a function! **" '("red")))
  (pos-tip-show
   (with-temp-buffer
     (let ((standard-output (current-buffer))
	   (help-xref-following t))
       (prin1 function)
       (princ " is ")
       (describe-function-1 function)
       (buffer-string)))
   nil nil nil 0))

(define-key emacs-lisp-mode-map [(shift return)] 'my-describe-function)
(define-key lisp-interaction-mode-map [(shift return)] 'my-describe-function)
;;(define-key ielm-map [(shift return)] 'my-describe-function)


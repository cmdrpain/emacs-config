(require 'font-lock)
(setq-default font-lock-maximum-decoration t)
(global-font-lock-mode 1)

(require 'highlight-current-line)
(highlight-current-line-on 1)
(highlight-current-line-set-bg-color "gray30")


(setq eval-expression-print-level 10   ; default 4
      eval-expression-print-length 50) ; default 12

(require 'color-theme)
 (color-theme-initialize)
;;(color-theme-initialize) needs to be before (require 'theme-manager)
;; (require 'theme-manager)
(setq default-cursor-type 'bar)
(set-frame-font "-xos4-terminus-medium-r-normal--12-*-*-*-*-*-iso10646-1")
;;(set-frame-font "DejaVu Sans Mono 8")
(setq color-theme-is-global t)
;;; current:
(eval-after-load "color-theme" '(color-theme-pok-wob))


;; (eval-after-load "color-theme" '(color-theme-dark-info))
;; (eval-after-load "color-theme" '(color-theme-oswald))


(require 'mic-paren)
(paren-activate)

(require 'highlight-parentheses)
(require 'parenthesis)

(require 'linum)
(require 'modeline-posn)
(require 'iswitchb-highlight)
(require 'pair-mode)

(which-func-mode)
(delete-selection-mode 1)
(display-time)
(column-number-mode 1)
(transient-mark-mode 1)



(global-set-key "\M-\C-y" 'kill-ring-search)

(global-set-key "\C-xRET" 'nil)
(global-set-key "\C-x\C-n" 'nil)
;; (global-set-key "\C-z" nil)
;; (global-set-key "\C-v" nil)
(global-set-key [f1] 'woman)
(global-set-key [f5] 'switch-to-previous-buffer)
(global-set-key [f7] #'(lambda () (interactive) (revert-buffer nil t)))

(global-set-key [f8] 'fold-dwim-toggle)
(global-set-key [(shift F8)] 'fold-dwim-hide-all)
(global-set-key [(control F8)] 'fold-dwim-show-all)
;;(global-set-key [f8] 'iedit-mode)

(global-set-key [(f9)] 'compile)
(global-set-key [(shift f10)] 'indent-whole-buffer)
(global-set-key [(control meta f11)] 'reload-emacs-config)
(global-set-key [f11] 'incr-dwim)
(global-set-key [f12] 'tool-bar-mode)

(global-set-key [(control x) (control \;)] 'repeat-complex-command)
(global-set-key [(super o)] 'switch-window)
(global-set-key "\C-x\C-r" 'find-file-at-point)
(global-set-key "\M-]" 'scroll-up)
(global-set-key "\M-[" 'scroll-down)
(global-set-key (kbd "M-SPC") 'delete-horizontal-space)
(global-set-key "\C-x\C-b" 'ibuffer)
(global-set-key "\C-xb" 'iswitchb-buffer)
(global-set-key "\C-ha" 'apropos)
(global-set-key "\M-`" 'lacarte-execute-menu-command)
(global-set-key [(meta control F)] 'findr-search)
(global-set-key [(meta control r)] 'findr-query-replace)
;; (global-set-key "\C-z\C-n" 'windmove-down)
;; (global-set-key "\C-z\C-p" 'windmove-up)
(global-set-key "\C-c\C-s" 'isearch-forward-at-point)
;; TODO fix bm
;; (global-set-key "\C-z\C-n" 'bm-next)
;; (global-set-key "\C-z\C-p" 'bm-previous)
;; (global-set-key "\C-z\C-b" 'bm-toggle)
;; (global-set-key "\C-z\C-a" 'bm-bookmark-annotate)
;; (global-set-key "\C-z\C-s" 'bm-show)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-co" 'moccur)


(global-set-key "\C-c\C-o" 'moccur)
;;(global-set-key "\C-xr" 'recentf-open-more-files)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-xm" 'execute-extended-command)
(global-set-key "\M-o\M-o" 'font-lock-fontify-buffer)
(global-set-key "\M-;" 'comment-dwim) ;


;; (global-set-key [M-up] 'enlarge-window)
;; (global-set-key [M-right] 'other-window)
;; (global-set-key [(S-f10)] 'theme-prev)
;; (global-set-key [(S-f11)] 'theme-next)



;; Icicles

(require 'icicles)
(setq icicle-completions-format "horizontal")
;; (minibuffer-depth-indicate-mode 99)
;; (setq icicle-cycling-respects-completion-mode-flag t)
;; (setq icicle-modal-cycle-up-keys '([C-p]))
;; (setq icicle-modal-cycle-down-keys '([C-n]))

;;(setq completion-styles 'emacs22)
;;(setq confirm-nonexistent-file-or-buffer nil)
;; Copied from rubikitch's (emacswiki) config.

(add-hook 'icicle-mode-hook 'bind-my-icicles-keys)
(add-hook 'icicle-mode-hook 'my-icicle-mode-hook)

(defun my-icicle-mode-hook ()
  (setq icicle-default-cycling-mode nil))

(defun bind-my-icicles-keys ()
  "Replace some default Icicles bindings with others I prefer."
  (when icicle-mode
    (dolist (map (append (list minibuffer-local-completion-map
			       minibuffer-local-must-match-map)
			 (and (boundp 'minibuffer-local-filename-completion-map)
			      (list minibuffer-local-filename-completion-map))))
      (bind-my-icicles-keys--for-completion-map map)
      (bind-my-icicles-keys--for-all-minibuffer-map map))
    (bind-my-icicles-keys--for-all-minibuffer-map minibuffer-local-map)
    (bind-my-icicles-keys--for-icicle-mode-map icicle-mode-map)))

(defun bind-my-icicles-keys--for-all-minibuffer-map (map)
  (define-key map "\C-w" 'backward-kill-word))

;; I think default icicles key bindings are hard to type.
(defun bind-my-icicles-keys--for-completion-map (map)
  ;; (to "icicle-remap-example")
  ;; C-o is next to C-i.
  (define-key map "\C-o" 'icicle-apropos-complete) ; S-Tab
  ;; Narrowing is isearch in a sense. C-s in minibuffer is rarely used.
  (define-key map "\C-s" 'icicle-narrow-candidates) ; M-*
  ;; History search is isearch-backward chronologically:-)
  (define-key map "\C-r" 'icicle-history) ; M-h
  ;; (define-key map "\M-[" 'icicle-previous-apropos-candidate)
  ;; (define-key map [M-}] 'icicle-next-apropos-candidate-action)
  ;; (define-key map [M-{] 'icicle-previous-apropos-candidate-acion)
  ;; (define-key map [C-S-n] 'icicle-next-prefix-candidate-action)
  ;; (define-key map [C-S-p] 'icicle-previous-prefix-candidate-action)
  ;; (define-key map "\C-n" 'icicle-next-prefix-candidate)
  ;; (define-key map "\C-p" 'icicle-previous-prefix-candidate)
  ;; (define-key map "\C-n" 'icicle-modal-cycle-up-keys)
  ;; (define-key map "\C-p" 'icicle-modal-cycle-down-keys)
  (define-key map "\C-n" 'icicle-next-candidate-per-mode)
  (define-key map "\C-p" 'icicle-previous-candidate-per-mode)
  (define-key map "\C-a" 'beginning-of-line)
  (define-key map "\C-e" 'end-of-line)
  ;; I do not use icicles' C-v M-C-v anymore.
  (define-key map "\C-v" 'scroll-other-window) ; M-C-v
  (define-key map "\M-v" 'scroll-other-window-down)
  )

(defun bind-my-icicles-keys--for-icicle-mode-map (map)
  ;; These are already bound in global-map. I'll remap them.
  (define-key map [f5] nil)	; icicle-kmacro
  (define-key map "\C-c/" nil)
  ;;(define-key map [pause] )		; 
  )

(defun bind-my-s-tab-for-org-mode (&optional arg)
  "Binds [S-tab] to cycle the outline in Org-Mode
    and use the icicle mode functions otherwise."
  (interactive "P")
  (if (string= mode-name "Org")
      (org-shifttab arg)
    (icicle-generic-S-tab)))

(icy-mode t)


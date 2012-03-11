(defun my-c-mode-hook ()
  (local-set-key "\C-c\C-w" 'nil)
  (local-set-key "\C-c\C-b" nil)
  (local-set-key [f6] 'eassist-switch-h-cpp)
  (local-set-key [(meta return)] 'semantic-analyze-proto-impl-toggle)
  (local-set-key (kbd "RET") 'newline-and-indent)
  (local-set-key [(control c) / /] 'srecode-insert)
  (c-set-style "linux")
  (cwarn-mode)
  (c-toggle-auto-newline -1)
  (subword-mode 1)
  ;; (add-to-list 'c-cleanup-list 'space-before-funcall)
  ;; (font-lock-add-keywords 'c++-mode '(("[\\<\\(Q_OBJECT\|Q_INTERFACES\\(.*\\)\\|public slots\\|public signals\\|private slots\\|private signals\\|protected slots\\|protected signals\\)\\>" . font-lock-constant-face)))
  )

(add-hook 'c-mode-common-hook 'my-c-mode-hook)

;; (defun my-c++-mode-hook ()
;;   (define-key c++-mode-map (kbd "<f7>") 'kdab-insert-header)
;;   (define-key c++-mode-map (kbd "<S-f7>") 'kdab-insert-forward-decl)
;;   (define-key c++-mode-map (kbd "<C-f7>") 'kdab-lookup-qt-documentation))
;; (add-hook 'c-mode-common-hook 'fci-mode)

;; (require 'doc-mode)
;; (add-hook 'c-mode-common-hook 'doc-mode)





















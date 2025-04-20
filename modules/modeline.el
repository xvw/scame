;; A more expressive mode-line
(use-package doom-modeline
  :ensure t
  :config
  (setq doom-modeline-buffer-file-name-style 'relative-from-project
        doom-modeline-support-imenu t
        doom-modeline-height 25
        doom-modeline-icon t
        doom-modeline-buffer-state-icon t
        doom-modeline-buffer-modification-icon t
        doom-modeline-lsp-icon t)
  :init
  (doom-modeline-mode))

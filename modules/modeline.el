;; A more expressive mode-line
(use-package doom-modeline
  :ensure t
  :config
  (setq doom-modeline-buffer-file-name-style 'relative-from-project)
  :init
  (doom-modeline-mode))

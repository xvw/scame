;; Global module for dealing with web development

;; Emmet for completion
(use-package emmet-mode
  :ensure t
  :hook (css-mode web-mode html-mode)
  :config
  (setq emmet-move-cursor-between-quotes t))

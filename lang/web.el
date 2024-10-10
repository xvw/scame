;; Global module for dealing with web development

(use-package web-mode
  :ensure t
  :config
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 4))

;; Emmet for completion
(use-package emmet-mode
  :ensure t
  :hook (css-mode web-mode html-mode)
  :config
  (setq emmet-move-cursor-between-quotes t))

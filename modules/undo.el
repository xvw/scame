;; Visual Undo-tree
(use-package vundo
  :ensure t
  :config
  (setq vundo-compact-display t)
  (setq vundo-glyph-alist vundo-unicode-symbols)
  :bind
  (("C-x u" . vundo)))

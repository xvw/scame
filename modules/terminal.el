;; Install vterm
(use-package vterm
  :ensure t)

(use-package vterm-toggle
  :ensure t
  :bind
  (("C-<return>" . vterm-toggle)))

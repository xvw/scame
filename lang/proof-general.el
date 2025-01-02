(use-package proof-general
  :ensure t)

(use-package company-coq
  :ensure t
  :hook (coq-mode . company-coq-mode))

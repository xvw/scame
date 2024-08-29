;; Support for OCaml edition


(use-package tuareg
  :ensure t
  :mode (("\\.ocamlinit\\'" . tuareg-mode)))

(use-package dune
  :ensure t)

(use-package merlin
  :ensure t
  :config
  (add-hook 'tuareg-mode-hook 'merlin-mode)
  :init
  (merlin-mode))

(use-package merlin-eldoc
  :ensure t
  :hook (merlin-mode . merlin-eldoc-setup))

(use-package utop
  :ensure t
  :config
  (add-hook 'tuareg-mode-hook 'utop-minor-mode))

(use-package ocp-indent
  :ensure t
  :config
  (add-hook 'tuareg-mode-hook 'ocp-setup-indent))

(use-package ocamlformat
  :ensure t
  :config
  (add-hook
   'tuareg-mode-hook
   (lambda ()
     (setq ocamlformat-show-errors "echo")
     (add-hook 'before-save-hook #'ocamlformat-before-save))))

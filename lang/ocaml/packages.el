(use-package merlin
  :ensure t
  :config
  (add-hook 'tuareg-mode-hook 'merlin-mode)
  (require 'merlin-imenu)
  :init
  (merlin-mode))

(use-package dune
  :ensure t)

(use-package merlin-iedit
  :ensure t)

(use-package ocp-indent
  :ensure t
  :config
  (add-hook 'tuareg-mode-hook 'ocp-setup-indent))


(use-package utop
  :ensure t
  :config
  (add-hook 'tuareg-mode-hook 'utop-minor-mode))

;; Import eldoc that display the list of argument of a function call,
;; currently writing
(use-package merlin-eldoc
  :ensure t
  :hook (merlin-mode . merlin-eldoc-setup))


(use-package opam-switch-mode
  :ensure t
  :hook
  ((tuareg-mode merlin-mode) . opam-switch-mode))

(use-package ocamlformat
  :ensure t
  :config
  (add-hook
   'tuareg-mode-hook
   (lambda ()
     (setq ocamlformat-show-errors "echo")
     (add-hook 'before-save-hook #'ocamlformat-before-save))))

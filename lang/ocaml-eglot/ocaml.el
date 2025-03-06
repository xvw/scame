(load "lang/ocaml/tuareg")

(use-package dune
  :ensure t)

(use-package utop
  :ensure t
  :hook
  (tuareg-mode . utop-minor-mode))

(use-package opam-switch-mode
  :ensure t
  :hook
  (tuareg-mode . opam-switch-mode))

(use-package ocaml-eglot
  :ensure t
  :after tuareg
  :hook
  (tuareg-mode . ocaml-eglot)
  (ocaml-eglot . eglot-ensure)
  :config
  (add-hook #'ocaml-eglot-hook
            (lambda ()
              (add-hook #'before-save-hook #'eglot-format nil t))))

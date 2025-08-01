(load "lang/ocaml/tuareg")

(use-package ocaml-eglot
  :ensure t
  :after tuareg
  :hook
  (tuareg-mode . ocaml-eglot)
  (ocaml-eglot . eglot-ensure)
  (ocaml-eglot . (lambda () (add-hook #'before-save-hook #'eglot-format nil t)))
  :config
  (setq ocaml-eglot-syntax-checker 'flymake)
  (set-face-foreground 'eglot-diagnostic-tag-unnecessary-face "gold3")
  (set-face-background 'eglot-highlight-symbol-face "dark slate blue")
  (set-face-foreground 'eglot-highlight-symbol-face "plum"))


(use-package dune
  :ensure t)

(use-package opam-switch-mode
  :ensure t
  :hook
  (tuareg-mode . opam-switch-mode))

(use-package ocp-indent
  :ensure t
  :config
  (add-hook 'ocaml-eglot-hook 'ocp-setup-indent))

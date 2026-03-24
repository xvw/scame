(load "lang/ocaml/transient")
(load "lang/ocaml/neocaml")
(load "lang/ocaml/cram")

(defun xvw-ocaml-eglot-setup ()
  "My custom OCaml-eglot Setup"
  (add-hook #'before-save-hook #'eglot-format nil t)
  (local-set-key (kbd "<f6>") #'ocaml-build)
  (local-set-key (kbd "C-c b") #'ocaml-build))

(use-package ocaml-eglot
  :ensure t
  :after neocaml
  :hook
  (tuareg-mode . ocaml-eglot)
  ((neocaml-mode neocaml-interface-mode tuareg-mode) . ocaml-eglot)
  (ocaml-eglot . eglot-ensure)
  (ocaml-eglot . xvw-ocaml-eglot-setup)
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
  (tuareg-mode . opam-switch-mode)
  (neocaml-mode . opam-switch-mode)
  (neocaml-interface-mode . opam-switch-mode))

(use-package ocp-indent
  :ensure t
  :config
  (add-hook
   'ocaml-eglot-hook
   (lambda ()
     (ocp-setup-indent)
     (setq-local indent-line-function #'ocp-indent-line)
     (setq-local indent-region-function #'ocp-ident-region))))

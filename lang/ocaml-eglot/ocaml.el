(load "lang/ocaml/tuareg")
(add-to-list 'load-path "~/Projects/perso/ocaml-eglot")
(require 'ocaml-eglot)
(add-hook #'tuareg-mode-hook #'ocaml-eglot)
(add-hook #'ocaml-eglot-hook #'eglot-ensure)
(add-hook #'after-save-hook #'eglot-format)
(add-hook 'eglot-managed-mode-hook (lambda () (eglot-inlay-hints-mode -1))) 

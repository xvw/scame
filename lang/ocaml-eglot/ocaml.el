(load "lang/ocaml/tuareg")
(add-to-list 'load-path "~/Projects/perso/ocaml-eglot")
(require 'ocaml-eglot)
(add-hook #'tuareg-mode-hook #'ocaml-eglot)
(add-hook #'ocaml-eglot-hook #'eglot-ensure)
(add-hook #'ocaml-eglot-hook
          (lambda () (add-hook #'before-save-hook #'eglot-format nil t)))

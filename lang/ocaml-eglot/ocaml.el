(load "lang/ocaml/tuareg")

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

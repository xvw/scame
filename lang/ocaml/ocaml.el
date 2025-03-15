(use-package neocaml
  :vc (:url "https://github.com/bbatsov/neocaml" :rev :newest)
  :config
  (with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
                 '(neocaml-mode . ("ocamllsp")))
    (add-to-list 'eglot-server-programs
                 '(neocamli-mode . ("ocamllsp")))))

(use-package dune
  :ensure t)

(use-package opam-switch-mode
  :ensure t
  :hook
  (neocaml-mode . opam-switch-mode))

(use-package ocaml-eglot
  :ensure t
  :after neocaml
  :hook
  (neocaml-mode . ocaml-eglot)
  (neocamli-mode . ocaml-eglot)
  (ocaml-eglot . eglot-ensure)
  :config
  (add-hook #'ocaml-eglot-hook
            (lambda ()
              (add-hook #'before-save-hook #'eglot-format nil t))))


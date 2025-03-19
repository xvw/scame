(use-package neocaml
  :vc (:url "https://github.com/bbatsov/neocaml" :rev :newest)
  :config
  (with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
                 '(neocaml-mode . ("ocamllsp")))
    (add-to-list 'eglot-server-programs
                 '(neocamli-mode . ("ocamllsp")))))

(use-package neocaml
  :ensure t
  :hook
  (neocaml-mode . prettify-symbols-mode)
  :config
  ;; Register neocaml modes with Eglot-Managed-Mode-Hook
  (with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
                 '((neocaml-mode neocaml-interface-mode) . ("ocamllsp")))))

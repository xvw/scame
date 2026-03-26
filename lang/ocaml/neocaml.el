(defun neocaml-ocp-indent-setup ()
  (setq-local indent-line-function #'ocp-indent-line)
  (setq-local indent-region-function #'ocp-indent-region))

(use-package neocaml
  :ensure t
  :hook
  (neocaml-base-mode . neocaml-ocp-indent-setup)
  (neocaml-base-mode . outline-minor-mode)
  (neocaml-base-mode . neocaml-repl-minor-mode)
  (neocaml-base-mode . neocaml-dune-interaction-mode)
  (neocaml-dune-mode . neocaml-dune-interaction-mode)
  (neocaml-opam-mode . neocaml-dune-interaction-mode)
  (neocaml-opam-mode . flymake-mode)
  :config
  (setq treesit-font-lock-level 4)
  ;; Register neocaml modes with Eglot-Managed-Mode-Hook
  (with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
                 '((neocaml-mode neocaml-interface-mode) . ("ocamllsp")))))

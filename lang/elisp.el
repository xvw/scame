(use-package package-lint
  :ensure t)

(add-hook 'emacs-lisp-mode-hook #'flymake-mode)

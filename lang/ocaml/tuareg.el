(use-package tuareg
  :ensure t
  :mode (("\\.ocamlinit\\'" . tuareg-mode))
  :config
  (set-face-attribute 'tuareg-font-lock-constructor-face nil :weight 'bold)
  :init
  (require 'flymake-proc))

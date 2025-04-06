(use-package tuareg
  :ensure t
  :mode (("\\.ocamlinit\\'" . tuareg-mode))
  :config

  ;; Set constructor in Bold for readability purpose
  (set-face-attribute 'tuareg-font-lock-constructor-face nil :weight 'bold))

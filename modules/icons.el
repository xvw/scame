;; A set of icons used in particular by doomline-mode
(use-package nerd-icons)

;; Emoji in Emacs
(use-package emojify
  :hook (after-init . global-emojify-mode))

;; Dired improvement
(use-package all-the-icons
  :ensure t)

(use-package all-the-icons-nerd-fonts
  :after all-the-icons
  :demand t
  :config
  (all-the-icons-nerd-fonts-prefer))

(use-package all-the-icons-dired
  :ensure t
  :hook (dired-mode))

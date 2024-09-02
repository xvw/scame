;; This directory contains all the configuration relating to the Emacs
;; learning process (UI changes, themes information, etc.).

(load "ui/preset")

(use-package gruvbox-theme
  :ensure t)

(load-theme 'gruvbox-dark-hard t)

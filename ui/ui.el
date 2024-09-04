;; This directory contains all the configuration relating to the Emacs
;; learning process (UI changes, themes information, etc.).

(load "ui/preset")

(use-package color-theme-sanityinc-tomorrow
  :init (progn (load-theme 'sanityinc-tomorrow-day t t)
	       (load-theme 'sanityinc-tomorrow-night t t)
	       (load-theme 'sanityinc-tomorrow-blue t t)
	       (load-theme 'sanityinc-tomorrow-bright t t)
	       (load-theme 'sanityinc-tomorrow-eighties t t))
  :defer t
  :ensure t)

(use-package spacemacs-theme
  :init (progn (load-theme 'spacemacs-dark t t)
	       (load-theme 'spacemacs-light t t)
               (enable-theme 'spacemacs-dark))
  :defer t
  :ensure t)

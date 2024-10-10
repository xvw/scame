;; This directory contains all the configuration relating to the Emacs
;; theming process (UI changes, themes information, etc.).

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
	       (load-theme 'spacemacs-light t t))
  :defer t
  :ensure t)

(use-package gruvbox-theme
  :init (progn (load-theme 'gruvbox-dark-medium t t)
	       (load-theme 'gruvbox-dark-hard t t)
	       (load-theme 'gruvbox-light-medium t t)
	       (load-theme 'gruvbox-light-hard t t))
  :defer t
  :ensure t)
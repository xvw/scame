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

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)
  (load-theme 'doom-vibrant t)
  (load-theme 'doom-vibrant t)
  (load-theme 'doom-challenger-deep t)
  (load-theme 'doom-dracula t)
  (load-theme 'doom-gruvbox t)
  (load-theme 'doom-horizon t)
  (load-theme 'doom-Iosvkem t)
  (load-theme 'doom-laserwave t)
  (load-theme 'doom-material t)
  (load-theme 'doom-material t)
  (load-theme 'doom-moonlight t)
  (load-theme 'doom-nord t)
  (load-theme 'doom-oceanic-next t)
  (load-theme 'doom-palenight t)
  (load-theme 'doom-snazzy t)
  (load-theme 'doom-tomorrow-night t))

(use-package nord-theme
  :ensure t)

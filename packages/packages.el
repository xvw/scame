;; Everything to do with declarative package installation and default
;; package support, not related to language support.


;; Plumbing required to support packages via org, elpa and melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

;; Initialising and refreshing the list of packages
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))


;;Setting up the [use-package] primitive
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Language-independent package support

(load "packages/bedrock") ;; All the packages needed for my emacs
			  ;; configuration

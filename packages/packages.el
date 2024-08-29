;; Set-up the package manager

(require 'package)

;; provisioning packages repositories
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

;; Initialization
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; Use-package available
(require 'use-package)
(setq use-package-always-ensure t)

;; Fetch other dependencies
(load "packages/bedrock")

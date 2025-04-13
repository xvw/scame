;; Some pervasives configuration

;; Removes the splash-screen
(setq inhibit-startup-message t)

;; Deactivates the ringing tone for each invalid movement (because
;; it's infernal)
(setq ring-bell-function 'ignore)

;; Keeps a history of 25 persistent items
(setq history-length 25)
(savehist-mode 1)
(save-place-mode 1)

;; Deactivate intempstive and infernal popups
(setq use-dialog-box nil)

;; Applies automatic file system file updates (and does not notify)
(global-auto-revert-mode t)
(setq auto-revert-verbose nil)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-interval 1)

;; Move backup files in one directory From
;; https://emacs.stackexchange.com/questions/33/put-all-backups-into-one-backup-folder
(let ((backup-dir "~/tmp/emacs/backups")
      (auto-saves-dir "~/tmp/emacs/auto-saves/"))
  (dolist (dir (list backup-dir auto-saves-dir))
    (when (not (file-directory-p dir))
      (make-directory dir t)))
  (setq backup-directory-alist `(("." . ,backup-dir))
        auto-save-file-name-transforms `((".*" ,auto-saves-dir t))
        auto-save-list-file-prefix (concat auto-saves-dir ".saves-")
        tramp-backup-directory-alist `((".*" . ,backup-dir))
        tramp-auto-save-directory auto-saves-dir))

(setq backup-by-copying t    ; Don't delink hardlinks
      delete-old-versions t  ; Clean up the backups
      version-control t      ; Use version numbers on backups,
      kept-new-versions 5    ; keep some new versions
      kept-old-versions 2)   ; and some old ones, too


;; Enables automatic closing of brackets etc.
(electric-pair-mode 1)

;; Sort folder before in dired
(setq ls-lisp-use-insert-directory-program nil)
(require 'ls-lisp)
(setq ls-lisp-dirs-first t)

;; Support for cursor, line numbers, etc.
(global-display-line-numbers-mode 1)
(hl-line-mode 1)
(blink-cursor-mode 5)
(setq column-number-mode t)

;; use space instead of tabs
(setq-default indent-tabs-mode nil)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)

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


;;; Some Eglot configuration

(use-package flycheck-eglot
  :ensure t
  :after (flycheck eglot))

(add-hook #'eglot-managed-mode-hook
          (lambda ()
            (eglot-inlay-hints-mode -1)))

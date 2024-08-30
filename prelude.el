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
(global-auto-revert-mode 1)
(setq auto-revert-verbose nil)
(setq global-auto-revert-non-file-buffers t)

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

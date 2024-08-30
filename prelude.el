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

;; Enables automatic closing of brackets etc.
(electric-pair-mode 1)

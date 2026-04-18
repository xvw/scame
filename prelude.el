;; -*- lexical-binding: t; -*-

;; Auto create missing dir when opening a file
;; from: https://emacsredux.com/blog/2022/06/12/auto-create-missing-directories/

(defun er-auto-create-missing-dirs ()
  (let ((target-dir (file-name-directory buffer-file-name)))
    (unless (file-exists-p target-dir)
      (make-directory target-dir t))))

(add-to-list 'find-file-not-found-functions #'er-auto-create-missing-dirs)


;; Stealing from the Best Emacs Configs
;; from: https://emacsredux.com/blog/2026/04/07/stealing-from-the-best-emacs-configs/

;; Disable Bidirectional Text Scanning
;; Since I do not use Arabic or Hebrew language.
(setq-default bidi-display-reordering 'left-to-right
              bidi-paragraph-direction 'left-to-right)
(setq bidi-inhibit-bpa t)

;; Skip Fontification During Input
(setq redisplay-skip-fontification-on-input t)

;; Increase Process Output Buffer (notably for LSP)
(setq read-process-output-max (* 4 1024 1024)) ; 4MB

;; Don’t Render Cursors in Non-Focused Windows
(setq-default cursor-in-non-selected-windows nil)
(setq highlight-nonselected-windows nil)

;; Save the Clipboard Before Killing
(setq save-interprogram-paste-before-kill t)

;; No Duplicates in the Kill Ring
(setq kill-do-not-save-duplicates t)

;; Persist the Kill Ring Across Sessions
(setq savehist-additional-variables
      '(search-ring regexp-search-ring kill-ring))

;; Remove text-properties in Save Hist
(add-hook
 'savehist-save-hook
 (lambda ()
   (setq kill-ring
         (mapcar #'substring-no-properties
                 (cl-remove-if-not #'stringp kill-ring)))))

;; Auto-Chmod Scripts on Save
(add-hook 'after-save-hook
          #'executable-make-buffer-file-executable-if-script-p)

;; Sane Syntax in re-builder
(setq reb-re-syntax 'string)

;; Proportional Window Resizing
(setq window-combination-resize t)

;; Toggle C-x 1

(winner-mode +1)

(defun toggle-delete-other-windows ()
  "Delete other windows in frame if any, or restore previous window config."
  (interactive)
  (if (and winner-mode
           (equal (selected-window) (next-window)))
      (winner-undo)
    (delete-other-windows)))

(global-set-key (kbd "C-x 1") #'toggle-delete-other-windows)

;; Faster Mark Popping

(setq set-mark-command-repeat-pop t)

;; Recenter After save-place Restores Position
(advice-add 'save-place-find-file-hook :after
            (lambda (&rest _)
              (when buffer-file-name (ignore-errors (recenter)))))

;; Count occurences of search
(setopt isearch-lazy-count t)

;; Repeat mode
(repeat-mode 1)
(setq repeat-exit-timeout 3) ;; exit after 5 seconds of inactivity

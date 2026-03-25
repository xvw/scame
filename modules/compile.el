;; -*- lexical-binding: t -*-

(defun my-compile--autoclose (buf ctn)
  "Auto-close buffer *compilation* if it succeed."
  (if (string-match-p "\\`finished" ctn)
      (progn
        (message "Build finished")
        (run-with-timer
         1 nil
         (lambda ()
           (when-let*
               ((win (and (buffer-live-p buf)
                          (get-buffer-window buf t))))
             (when (> (count-windows) 1)
               (delete-window win))))))
    (message "Compilation: %s" ctn)))


;; Configuration
(setq compilation-window-height 10)
(setq compilation-scroll-output t)
(setq compilation-max-output-line-length nil)
(setq compilation-finish-functions (list #'my-compile--autoclose))

(add-to-list 'display-buffer-alist
             '("\\*compilation\\*"
               (display-buffer-reuse-window display-buffer-at-bottom)
               (window-height . 10)))

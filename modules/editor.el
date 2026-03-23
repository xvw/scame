(use-package whitespace
  :config
  (setq whitespace-display-mappings
        '((space-mark 32 [183])
          (tab-mark 9 [8614 9])))
  (setq whitespace-style '(face spaces tabs trailing space-mark tab-mark))
  (setq whitespace-action '(cleanup auto-cleanup))
  :hook
  (conf-mode prog-mode))

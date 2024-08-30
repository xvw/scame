;; General configuration of Emacs appearance

;; Removal of unnecessary interface elements
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)

;; Configuring the editor's default font
(set-face-attribute 'default nil :font "Fira Code" :height 140)

;; Support for cursor, line numbers, etc.
(global-display-line-numbers-mode 1)
(hl-line-mode 1)
(blink-cursor-mode 5)
(setq column-number-mode t)

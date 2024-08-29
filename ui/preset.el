;; Clean the UI
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)

;; Global font preset
(set-face-attribute 'default nil :font "Fira Code" :height 140)


;; Goodies
(global-display-line-numbers-mode 1)
(hl-line-mode 1)
(blink-cursor-mode 5)

;; Theme selection
(load-theme 'wombat)

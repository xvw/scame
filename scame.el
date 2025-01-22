;; Scame is my (https://xvw.lol) personal configuration of Emacs, and
;; I also use it as an incubator for features that could potentially
;; be released as packages or as potential improvements to existing
;; modes.

;; The directories are organised (arguably correctly) so that they can
;; be scoped by theme.


(load "base")
(load "bindings/bindings")
(load "modules/modules")
(load "lang/lang")
(load "prelude")

;; Global configuration

(set-face-attribute 'default nil :font "Fira Code" :height 140)
(enable-theme 'doom-horizon)

;; Scame is my (https://xvw.lol) personal configuration of Emacs, and
;; I also use it as an incubator for features that could potentially
;; be released as packages or as potential improvements to existing
;; modes.

;; The directories are organised (arguably correctly) so that they can
;; be scoped by theme.

(require 'profiler)
(profiler-start 'cpu)

;; Global configuration

(load "base")
(load "bindings/bindings")
(load "modules/modules")
(load "lang/lang")
(load "prelude")

(set-face-attribute 'default nil :font "Fira Code" :height 140)
(enable-theme 'doom-moonlight)
;; (enable-theme 'doom-horizon)

(load "feeds")

;; Very cutsom and early stuff
(load "kohai")

(add-hook 'emacs-startup-hook
  (lambda ()
    (message "Emacs loaded in %.2f seconds with %d GCs"
             (float-time (time-subtract after-init-time before-init-time))
             gcs-done)))

(profiler-stop)
(profiler-report) ;; opens profiler buffer

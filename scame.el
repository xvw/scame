;; Scame is my (https://xvw.lol) personal configuration of Emacs, and
;; I also use it as an incubator for features that could potentially
;; be released as packages or as potential improvements to existing
;; modes.

;; The directories are organised (arguably correctly) so that they can
;; be scoped by theme.

(load "prelude")           ;; Generic utility functions and configuration

(load "packages/packages") ;; Generic packages used that affect the
                           ;; entire user experience

(load "ui/ui")             ;; Configuring the visual aspects of Emacs

(load "bindings/bindings") ;; Generic key bindings for all modes

(load "lang/lang")         ;; Concrete implementation of modes for
			   ;; different languages

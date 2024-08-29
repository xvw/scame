(use-package ligature
  :config
  ;; Enable the "www" ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))
  ;; Enable traditional ligature support in eww-mode, if the
  ;; `variable-pitch' face supports it
  (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
  ;; Enable all Cascadia and Fira Code ligatures in programming modes
  (ligature-set-ligatures
   'prog-mode
   '( ("=" (rx (+ (or ">" "<" "|" "/" "~" ":" "!" "="))))
      (";" (rx (+ ";")))
      ("&" (rx (+ "&")))
      ("!" (rx (+ (or "=" "!" "\." ":" "~"))))
      ("?" (rx (or ":" "=" "\." (+ "?"))))
      ("%" (rx (+ "%")))
      ("|" (rx (+ (or ">" "<" "|" "/" ":" "!" "}" "\]"
                      "-" "=" ))))
      ("\\" (rx (or "/" (+ "\\"))))
      ("+" (rx (or ">" (+ "+"))))
      (":" (rx (or ">" "<" "=" "//" ":=" (+ ":"))))
      ("/" (rx (+ (or ">"  "<" "|" "/" "\\" "\*" ":" "!"
                      "="))))
      ("\." (rx (or "=" "-" "\?" "\.=" "\.<" (+ "\."))))
      ("-" (rx (+ (or ">" "<" "|" "~" "-"))))
      ;; *> */ *)  ** *** ****
      ("*" (rx (or ">" "/" ")" (+ "*"))))
      ("w" (rx (+ "w")))
      ("<" (rx (+ (or "\+" "\*" "\$" "<" ">" ":" "~"  "!"
                      "-"  "/" "|" "="))))
      (">" (rx (+ (or ">" "<" "|" "/" ":" "=" "-"))))
      ("#" (rx (or ":" "=" "!" "(" "\?" "\[" "{" "_(" "_"
                   (+ "#"))))
      ("~" (rx (or ">" "=" "-" "@" "~>" (+ "~"))))_
      ("_" (rx (+ (or "_" "|"))))
      ("0" (rx (and "x" (+ (in "A-F" "a-f" "0-9")))))
      "Fl"  "Tl"  "fi"  "fj"  "fl"  "ft"
      "{|"  "[|"  "]#"  "(*"  "}#"  "$>"  "^="))
  (global-ligature-mode t))

(if (functionp 'require-theme)
    (require-theme 'modus-themes) ; for those provided by Emacs >= 28
  (require 'modus-themes))

;; Load the theme files before enabling a theme (else you get an error).
(modus-themes-load-themes)

;; A simple check to load the desired theme at startup based on what
;; the global preference for GNOME is.  If such preference is not
;; registered, it just loads `modus-operandi'.  Check my dotfiles for
;; the shell script called "delight", which handles system-wide theme
;; switching (as I bind the `modus-themes-toggle' to <f5>, delight is
;; bound to s-<f5> in the desktop's own custom key bindings).
(if (string-match-p
     "dark"
     (shell-command-to-string "gsettings get org.gnome.desktop.interface color-scheme"))
    (modus-themes-load-vivendi)
  (modus-themes-load-operandi))

(define-key global-map (kbd "<f5>") #'modus-themes-toggle)

(provide 'appearance)
;;; appearance.el ends here


;; Remove security vulnerability - NOT SURE Trusting Magnars :D
(eval-after-load "enriched"
  '(defun enriched-decode-display-prop (start end &optional param)
     (list start end)))

;; Set path to dependencies
(defvar site-lisp-dir)
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

(defvar settings-dir)
(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path settings-dir)
(add-to-list 'load-path site-lisp-dir)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;;(require 'package)

;; Set up appearance early
(require 'appearance)

;; Add external projects to load path
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Write all autosave files in the tmp dir
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


;; Write all autosave files in the tmp dir
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Don't write lock-files, I'm the only one here
(setq create-lockfiles nil)

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))
;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

;; Setup packages
(require 'setup-package)

;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   '(
;;     cider
;;     clojure-mode
;;     clojure-mode-extra-font-locking
;;     css-eldoc
     diff-hl
;;     deadgrep
;;     dockerfile-mode
;;     edn
;;     elisp-slime-nav
;;     f
;;     fill-column-indicator
;;     flx
;;     flx-ido
     flycheck
;;     flycheck-pos-tip
;;     flycheck-joker
     forge
;;     gist
;;     groovy-mode
;;     guide-key
;;     highlight-escape-sequences
;;     htmlize
;;     hydra
;;     ido-at-point
     ;; ido-completing-read+
     ;; ido-vertical-mode
     ;; inflections
     ;; kaocha-runner
     magit
     ;; markdown-mode
     ;; move-text
     ;; nodejs-repl
     ;; paredit
     ;; perspective
     ;; prodigy
     ;; projectile
     ;; request
     ;; restclient
     ;; ripgrep
     ;; simple-httpd
     smartparens
     ;; string-edit
     ;; visual-regexp
     ;; wgrep
     ;; whitespace-cleanup-mode
     ;; yasnippet
     ;; zprint-mode
     )))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; load stuff
(require 'sane-defaults)
(require 'key-bindings)
(require 'setup-magit)

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

;;flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Browse kill ring
(require 'browse-kill-ring)
(setq browse-kill-ring-quit-action 'save-and-restore)

;; Smart M-x is smart
(require 'smex)
(smex-initialize)

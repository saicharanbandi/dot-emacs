
;;; Sane defaults

;; disable menu-bar, tool-bar and scroll-bar
(if (fboundp 'menu-bar-mode)
    (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))

;; load theme
(if (not custom-enabled-themes)
    (load-theme 'modus-operandi t))

;; Setup package.el
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(unless package--initialized (package-initialize))

;; setup use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

;; Put Emacs auto-save and backup files to /tmp/ or C:/Temp/
(defconst emacs-tmp-dir (expand-file-name (format "emacs%d" (user-uid)) temporary-file-directory))
(setq
   backup-by-copying t                                        ; Avoid symlinks
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t
   auto-save-list-file-prefix emacs-tmp-dir
   auto-save-file-name-transforms `((".*" ,emacs-tmp-dir t))  ; Change autosave dir to tmp
   backup-directory-alist `((".*" . ,emacs-tmp-dir)))

;; Lockfiles unfortunately cause more pain than benefit
(setq create-lockfiles nil)

;;; Useful Defaults
(setq-default cursor-type 'bar)           ; Line-style cursor similar to other text editors
(setq inhibit-startup-screen t)           ; Disable startup screen
(setq initial-scratch-message "")         ; Make *scratch* buffer blank
(setq-default frame-title-format '("%b")) ; Make window title the buffer name
(setq ring-bell-function 'ignore)         ; Disable bell sound
(fset 'yes-or-no-p 'y-or-n-p)             ; y-or-n-p makes answering questions faster
(show-paren-mode 1)                       ; Show closing parens by default
(setq linum-format "%4d ")                ; Line number format
(delete-selection-mode 1)                 ; Selected text will be overwritten when you start typing
(global-auto-revert-mode t)               ; Auto-update buffer if file has changed on disk
(use-package undo-tree                    ; Enable undo-tree, sane undo/redo behavior
  :init (global-undo-tree-mode)
  :config (setq-default undo-tree-auto-save-history nil))
(add-hook 'before-save-hook
	  'delete-trailing-whitespace)    ; Delete trailing whitespace on save
(winner-mode 1)
(repeat-mode 1)
(setq dired-dwim-target t)                ; dired copy target automatically choses the other buffer in split-window
;; the t parameter apends to the hook, instead of prepending
;; this means it'd be run after other hooks that might fiddle
;; with the frame size
(add-hook 'window-setup-hook 'toggle-frame-maximized t)
;;(add-hook 'after-make-frame-hook #'toggle-frame-maximized) -> toggling isnt useful
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;;theme


;; Keybindings
(global-set-key (kbd "C-x C-j") 'dired-jump)     ;dired jump
(global-set-key (kbd "C-x f") 'find-name-dired)  ;find in dired
(global-set-key [f6] 'display-line-numbers-mode) ;linum mode
(global-set-key [f7] #'whitespace-mode)          ;whitespace mode


;;multi-cursors
(use-package multiple-cursors
  :ensure t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; treemacs
(use-package treemacs
  :ensure t
  :bind ("<f5>" . treemacs)
  :custom
  (treemacs-is-never-other-window t)
  ;;:hook
  ;;(treemacs-mode . treemacs-project-follow-mode)
  )

;;; vertico pos frame
(use-package vertico-posframe
  :ensure t
  :custom
  (vertico-posframe-parameters
   '((left-fringe . 8)
     (right-fringe . 8))))
(vertico-posframe-mode 1)

;;; golden ratio
(use-package golden-ratio
  :ensure t
  :hook (after-init . golden-ratio-mode)
  :custom
  (golden-ratio-exclude-modes '(occur-mode)))

;;;spacious padding mode
(use-package spacious-padding
  :ensure t
  :defer
  :hook (after-init . spacious-padding-mode)
  )

;;;;Corfu - to be reviewed

;;;; company mode
(use-package company
  :ensure t
  :hook (after-init . global-company-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;plantuml
(use-package plantuml-mode
  :ensure t
  :config
  (setq org-plantuml-jar-path (expand-file-name "/home/uic17457/plantuml.jar"))
  (setq plantuml-default-exec-mode 'jar)
  (add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))
  (org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t))))

;; whichkey
(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.7))

;;completion frameworks
(use-package vertico
  :ensure t
  :config
  (setq vertico-cycle t)
  (setq vertico-resize nil)
  (vertico-mode 1))

;;Terminal
(use-package vterm
  :ensure t
  :commands vterm
  :config
  (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *")
  ;;(setq vterm-shell "zsh")
  (setq vterm-max-scrollback 10000))

;; C/C++ code
(setq-default c-indent-tabs-mode nil      ; Pressing TAB should cause indentation
	      c-indent-level 4            ; A TAB is equivalent to four spaces
	      c-argdecl-indent 0          ; Do not indent argument decl's extra
	      c-tab-always-indent t
	      backward-delete-function nil) ; Do not expand tabs when deleting
(c-add-style "my-c-style" '((c-continued-statement-offset 4))) ; If a statement continues on the next line, indent the continuation by 4
(defun my-c-mode-hook ()
  (c-set-style "my-c-style")
  (c-set-offset 'substatement-open '0)    ; brackes should be at the same indentation level as the statements they open
  (c-set-offset 'inline-open '+)
  (c-set-offset 'block-open '+)
  (c-set-offset 'brace-list-open '+)      ; all "opens" should be indented by the c-indent-level
  (c-set-offset 'case-label '+))          ; indent case labels by c-indent-level, too#
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my-c-mode-hook)
(setq-default indent-tabs-mode nil)



;;org-mode
(defun turn-on-automatic-fill ()
  (auto-fill-mode 1)
  ;;(refill-mode 1)
  )
(setq org-log-done t)
(global-set-key (kbd "C-c a") 'org-agenda)
;(add-hook 'org-mode-hook 'turn-on-automatic-fill)
(add-hook 'text-mode-hook 'turn-on-automatic-fill)

;; Mouse scrolling in terminal emacs (unless (display-graphic-p)
;;activate mouse-based scrolling
(xterm-mouse-mode 1)
(global-set-key (kbd "<mouse-4>") 'scroll-down-line)
(global-set-key (kbd "<mouse-5>") 'scroll-up-line)

;;;GIT
;; Magit
(use-package magit)
;; Git-gutter
(use-package git-gutter
  :ensure t
  :hook (prog-mode . git-gutter-mode)
  :config
  (setq git-gutter:update-interval 0.02))

(use-package git-gutter-fringe
  :ensure t
  :config
  (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(find-name-arg "-iname")
 '(indent-tabs-mode nil)
 '(org-agenda-files nil)
 '(package-selected-packages
   '(multiple-cursors company spacious-padding golden-ratio vertico-posframe treemacs corfu which-key whichkey vterm vertico magit use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fringe ((t :background "#000000")))
 '(header-line ((t :box (:line-width 4 :color "#212121" :style nil))))
 '(header-line-highlight ((t :box (:color "#ffffff"))))
 '(keycast-key ((t)))
 '(line-number ((t :background "#000000")))
 '(mode-line ((t :box (:line-width 6 :color "#323232" :style nil))))
 '(mode-line-active ((t :box (:line-width 6 :color "#323232" :style nil))))
 '(mode-line-highlight ((t :box (:color "#ffffff"))))
 '(mode-line-inactive ((t :box (:line-width 6 :color "#1e1e1e" :style nil))))
 '(tab-bar-tab ((t :box (:line-width 4 :color "#0e0e0e" :style nil))))
 '(tab-bar-tab-inactive ((t :box (:line-width 4 :color "#424242" :style nil))))
 '(tab-line-tab ((t)))
 '(tab-line-tab-active ((t)))
 '(tab-line-tab-inactive ((t)))
 '(vertical-border ((t :background "#000000" :foreground "#000000")))
 '(window-divider ((t (:background "#000000" :foreground "#000000"))))
 '(window-divider-first-pixel ((t (:background "#000000" :foreground "#000000"))))
 '(window-divider-last-pixel ((t (:background "#000000" :foreground "#000000")))))

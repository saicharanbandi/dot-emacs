;; expand sections by default
(setq magit-section-initial-visibility-alist
      '((untracked . show)
        (unstaged . show)
        (unpushed . show)
        (unpulled . show)
        (stashes . show)))

;; full screen magit-status
(defun magit-status-fullscreen (prefix)
  (interactive "P")
  (magit-status)
  (unless prefix
    (delete-other-windows)))

;; don't prompt me
(set-default 'magit-push-always-verify nil)
(set-default 'magit-revert-buffers 'silent)
(set-default 'magit-no-confirm '(stage-all-changes
                                 unstage-all-changes))

;; Real dates, please
(set-default 'magit-log-margin '(t "%Y-%m-%d %H:%M " magit-log-margin-width t 18))

;; move cursor into position when entering commit message
(defun my/magit-cursor-fix ()
  (beginning-of-buffer)
  (when (looking-at "#")
    (forward-line 2)))

(add-hook 'git-commit-mode-hook 'my/magit-cursor-fix)

;; full screen vc-annotate
(defun vc-annotate-quit ()
  "Restores the previous window configuration and kills the vc-annotate buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :vc-annotate-fullscreen))

(eval-after-load "vc-annotate"
  '(progn
     (defadvice vc-annotate (around fullscreen activate)
       (window-configuration-to-register :vc-annotate-fullscreen)
       ad-do-it
       (delete-other-windows))

     (define-key vc-annotate-mode-map (kbd "q") 'vc-annotate-quit)))

(set-default 'magit-diff-refine-hunk t)

;; update diff-hl
(global-diff-hl-mode)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

;; use forge
(with-eval-after-load 'magit
  (require 'forge))

(provide 'setup-magit)

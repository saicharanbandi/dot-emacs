;; Completion that uses many different methods to find options.
(global-set-key (kbd "C-.") 'hippie-expand-no-case-fold)
(global-set-key (kbd "C-:") 'hippie-expand-lines)
(global-set-key (kbd "C-,") 'completion-at-point)

;; Eval buffer
(global-set-key (kbd "C-c C-k") 'eval-buffer)

;;Create new frame
(define-key global-map (kbd "C-x C-n") 'make-frame-command)

;; Comment/uncomment block
(defun comment-or-uncomment-line-or-region ()
  "Comments or uncomments the current line or region."
  (interactive)
  (if (region-active-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    )
  )
(global-set-key (kbd "C-c c") 'comment-or-uncomment-line-or-region)
;;(global-set-key (kbd "C-c u") 'uncomment-region)
;;(global-set-key (kbd "C-c C") 'toggle-comment-on-line)

;; Magit
(global-set-key (kbd "C-x m") 'magit-status-fullscreen)
(autoload 'magit-status-fullscreen "magit")

;; Browse the kill ring
(global-set-key (kbd "C-x C-y") 'browse-kill-ring)

(global-set-key (kbd "C-x 3") 'split-window-right-and-move-there-dammit)

;; Create scratch buffer
(global-set-key (kbd "C-c b") 'create-scratch-buffer)

;; Move windows, even in org-mode
(global-set-key (kbd "<M-S-right>") 'windmove-right)
(global-set-key (kbd "<M-S-left>") 'windmove-left)
(global-set-key (kbd "<M-S-up>") 'windmove-up)
(global-set-key (kbd "<M-S-down>") 'windmove-down)

(provide 'key-bindings)

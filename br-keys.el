(if (not (equal window-system nil)) 
    (progn
      (global-unset-key (kbd "C-z"))
      (global-set-key (kbd "C-z") 'comment-or-uncomment-region)
      )
  )

(global-set-key (kbd "C-x <f2>") 'rename-buffer)

(progn
  ;; It's all about the project.
  (global-set-key (kbd "C-c f") 'find-file-in-project)

  ;; You know, like Readline.
  (global-set-key (kbd "C-M-h") 'backward-kill-word)

  ;; Completion that uses many different methods to find options.
  (global-set-key (kbd "M-/") 'hippie-expand)

  ;; Perform general cleanup.
  (global-set-key (kbd "C-c n") 'esk-cleanup-buffer)

  ;; Turn on the menu bar for exploring new modes
  (global-set-key (kbd "C-<f10>") 'menu-bar-mode)

  ;; Font size
  (define-key global-map (kbd "C-+") 'text-scale-increase)
  (define-key global-map (kbd "C--") 'text-scale-decrease)

  ;; Use regex searches by default.
  (global-set-key (kbd "C-s") 'isearch-forward-regexp)
  (global-set-key (kbd "\C-r") 'isearch-backward-regexp)
  (global-set-key (kbd "C-M-s") 'isearch-forward)
  (global-set-key (kbd "C-M-r") 'isearch-backward)

  ;; Jump to a definition in the current file. (Protip: this is awesome.)
  (global-set-key (kbd "C-x C-i") 'imenu)

  ;; File finding
  (global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
  (global-set-key (kbd "C-c y") 'bury-buffer)
  (global-set-key (kbd "C-c r") 'revert-buffer)

  ;; Window switching. (C-x o goes to the next window)
  (windmove-default-keybindings) ;; Shift+direction
  (global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1))) ;; back one
  (global-set-key (kbd "C-x C-o") (lambda () (interactive) (other-window 2))) ;; forward two

  ;; Start eshell or switch to it if it's active.
  (global-set-key (kbd "C-x m") 'eshell)

  ;; Start a new eshell even if one is active.
  (global-set-key (kbd "C-x M") (lambda () (interactive) (eshell t)))

  ;; Start a regular shell if you prefer that.
  (global-set-key (kbd "C-x C-m") 'shell)

  ;; If you want to be able to M-x without meta (phones, etc)
  (global-set-key (kbd "C-c x") 'execute-extended-command)

  ;; Help should search more than just commands
  (global-set-key (kbd "C-h a") 'apropos)

  ;; Should be able to eval-and-replace anywhere.
  (global-set-key (kbd "C-c e") 'esk-eval-and-replace)

  ;; M-S-6 is awkward
  (global-set-key (kbd "C-c q") 'join-line)

  ;; So good!
  (global-set-key (kbd "C-c g") 'magit-status)

  ;; This is a little hacky since VC doesn't support git add internally
  (eval-after-load 'vc
    (define-key vc-prefix-map "i"
      '(lambda () (interactive)
         (if (not (eq 'Git (vc-backend buffer-file-name)))
             (vc-register)
           (shell-command (format "git add %s" buffer-file-name))
           (message "Staged changes.")))))

  ;; Activate occur easily inside isearch
  (define-key isearch-mode-map (kbd "C-o")
    (lambda () (interactive)
      (let ((case-fold-search isearch-case-fold-search))
        (occur (if isearch-regexp isearch-string (regexp-quote isearch-string)))))))

(global-set-key (kbd "C-c v") 'eval-buffer)

(global-set-key (kbd "C-c f") 'iy-go-to-char)
(global-set-key (kbd "C-c F") 'iy-go-to-char-backward)
(global-set-key (kbd "C-c ;") 'iy-go-to-char-continue)
(global-set-key (kbd "C-c ,") 'iy-go-to-char-continue-backward)


(provide 'br-keys)

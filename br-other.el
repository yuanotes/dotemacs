;; (if (string-match "Aquamacs" (emacs-version))
;;     ;; Aquamacs in OSX
;;     (progn
;;       ;; mac key modifier

;;       )
;;   )

;; (require 'multi-term)
;; (setq multi-term-program "/bin/bash"
;;       multi-term-buffer-name "InMyDream")

;; (setq term-bind-key-alist '(
;;                             ("M-DEL" . term-send-backward-kill-word)
;;                             ("M-<backspace>" . term-send-backward-kill-word)
;;                             ("M-d" . term-send-forward-kill-word)
;;                             ("C-r" . term-send-raw)
;;                             ("C-c C-c" . term-interrupt-subjob)
;;                             ("C-p" . previous-line)
;;                             ("C-n" . next-line)
;;                             ("C-z" . term-send-raw)
;;                            ;; ("C-r" . isearch-backward)
;;                             ("C-m" . term-send-raw)
;;                             ("M-f" . term-send-forward-word)
;;                             ("M-b" . term-send-backward-word)
;;                             ("M-o" . term-send-backspace)
;;                             ("M-p" . term-send-up)
;;                             ("M-n" . term-send-down)
;;                             ("M-M" . term-send-forward-kill-word)
;;                             ("M-N" . term-send-backward-kill-word)
;;                             ("M-r" . term-send-reverse-search-history)
;;                             ("M-," . term-send-input)
;;                             ("M-." . comint-dynamic-complete)
;;                             )
;;       )



;; save current session when exit
;;(desktop-save-mode 1)


;; 在退出 emacs 之前确认是否退出
(setq confirm-kill-emacs 'yes-or-no-p)

;; helm
(helm-mode t)
(require 'helm-match-plugin)            ;need type a space between two
                                        ;patterns

(require 'helm-buffers)
(global-set-key (kbd "C-x b") 'helm-buffers-list)

(require 'helm-files)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-b") 'helm-recentf)


;; windows 返回模式
(when (fboundp 'winner-mode) 
  (winner-mode) 
  (windmove-default-keybindings))

;;pcomplete
(defconst pcompl-git-commands
  '("add" "bisect" "branch" "checkout" "clone"
    "commit" "diff" "fetch" "grep"
    "init" "log" "merge" "mv" "pull" "push" "rebase"
    "reset" "rm" "show" "status" "tag")
  "List of `git' commands.")

(defun pcomplete/git ()
  "Completion for `git'."
  ;; Completing for command argument.
  (pcomplete-here* pcompl-git-commands)

  ;; complete files/dirs forever if the command is `add' or `rm'.
  (if (pcomplete-match (regexp-opt '("add" "rm")) 1)
      (while (pcomplete-here (pcomplete-entries))))
  )


;;ecb
;;(require 'ecb)
;;(setq stack-trace-on-error t)


;;auto-complete
(require 'auto-complete)
(global-auto-complete-mode t)


;; auto-revert
(global-auto-revert-mode t)

;; remember-mode
(setq org-default-notes-file "~/Dropbox/org/notes"
      remember-annotation-functions '(org-remember-annotation)
      remember-handler-functions '(org-remember-handler)
      )
(add-hook 'remember-mode-hook 'org-remember-apply-template)
(define-key global-map "\C-cr" 'org-remember)

;; templates



;; There is no ispell in homebrew, use aspell instead.
(setq ispell-program-name "aspell")


(require 'which-func)
(which-function-mode t)

;;(require 'edit-server)
;;(edit-server-start)

;; show column number
(column-number-mode t)

;; show line number of the left margin
;;(global-linum-mode t)
;;(setq linum-format "%d ")

(require 'projectile)
(require 'helm-projectile)
(projectile-global-mode t)
(setq projectile-enable-caching t
      projectile-project-root-files '(".git" ".hg" ".bzr" "_darcs" ".projectile" ".ropeproject")
      projectile-ignored-files '("TAGS")
      projectile-ignored-file-extensions '("class" "o" "so" "elc" "pyc")
      projectile-ignored-directories '(".idea" ".venv" ".git" ".ropeproject"))


;; magit
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)


;;js2-mode
(add-hook 'js2-mode-hook '(lambda ()
                      (progn
                        (setq js2-basic-offset 2
                              js2-enter-indents-newline t)
                        )))


(provide 'br-other)

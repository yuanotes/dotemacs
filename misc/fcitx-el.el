;; (if (minibufferp)
;;     (progn (insert "t")
;;            (shell-command-to-string "fcitx-remote -c"))
;;   (insert "n")
;;   )
;; (defun fcitx-mode-quit ()
;;   (remove-hook 'kill-emacs-hook 'ibus-mode-off))

;; (defun fcitx-mode-off ()
;;   "Turn ibus-mode off."
;;   (interactive)
;;   ())
;; (defun fcitx-mode-on ()
;;   "Turn fcitx-mode on."
;;   (interactive)
;;   (if (not (or (eq window-system 'x)
;;                (getenv "DISPLAY")))
;;       (fcitx-mode-quit)
;;     ;else
;;     ))

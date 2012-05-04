(progn
  (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'emacs-lisp-mode-hook 'esk-remove-elc-on-save)
  (add-hook 'emacs-lisp-mode-hook 'esk-prog-mode-hook)
  (add-hook 'emacs-lisp-mode-hook 'elisp-slime-nav-mode)

  (defun esk-remove-elc-on-save ()
    "If you're saving an elisp file, likely the .elc is no longer valid."
    (make-local-variable 'after-save-hook)
    (add-hook 'after-save-hook
              (lambda ()
                (if (file-exists-p (concat buffer-file-name "c"))
                    (delete-file (concat buffer-file-name "c"))))))

  (define-key emacs-lisp-mode-map (kbd "C-c v") 'eval-buffer)

;;; Enhance Lisp Modes

  (define-key read-expression-map (kbd "TAB") 'lisp-complete-symbol)
  (define-key lisp-mode-shared-map (kbd "RET") 'reindent-then-newline-and-indent)

  ;; TODO: look into parenface package
  (defface esk-paren-face
    '((((class color) (background dark))
       (:foreground "grey50"))
      (((class color) (background light))
       (:foreground "grey55")))
    "Face used to dim parentheses."
    :group 'starter-kit-faces)

  (eval-after-load 'paredit
    ;; need a binding that works in the terminal
    '(define-key paredit-mode-map (kbd "M-)") 'paredit-forward-slurp-sexp))

  (dolist (mode '(scheme emacs-lisp lisp clojure))
    (when (> (display-color-cells) 8)
      (font-lock-add-keywords (intern (concat (symbol-name mode) "-mode"))
                              '(("(\\|)" . 'esk-paren-face))))
    (add-hook (intern (concat (symbol-name mode) "-mode-hook"))
              'esk-turn-on-paredit)
    (add-hook (intern (concat (symbol-name mode) "-mode-hook"))
              'esk-turn-on-paredit))

  (defun esk-pretty-fn ()
    (font-lock-add-keywords nil `(("(\\(fn\\>\\)"
                                   (0 (progn (compose-region (match-beginning 1)
                                                             (match-end 1)
                                                             "\u0192") nil))))))
  (add-hook 'clojure-mode-hook 'esk-pretty-fn))


;; (require 'slime)
;; (require 'slime-autoloads)

;; (add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
;; (add-hook 'inferior-lisp-mode-hook (lambda (inferior-slime-mode t)))

;; (slime-setup '(slime-fancy slime-repl))

;; (setq slime-backend (concat slime-path "swank-loader.lisp")
;;       inferior-lisp-program "/usr/bin/sbcl"
;;       ;;inferior-lisp-program "/usr/bin/clisp"
;;       ;;slime-complete-symbol-function "Fuzzy"
;;       ;;slime-enable-evaluate-in-emacs t
;;       slime-kill-without-query-p t
;;       slime-lisp-implementations '((sbcl ("/usr/bin/sbcl" "--core" "/home/brooklyn/.emacs.d/sbcl.core-for-slime")))
;;       )

(provide 'br-lisp)

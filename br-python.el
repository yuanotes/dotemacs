(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.wsgi\\'" . python-mode))

;; When call python-mode function, call that from `python-mode.el' or
;; `python-mode.elc' int the load-path.
(autoload 'python-mode "python-mode" "Python Mode." t)


;; Enable python-mode for .py file
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

;; When the interpreter is python, then enable `python-mode'.
(add-to-list 'interpreter-mode-alist '("python" . python-mode))


;; Initialize pymacs
(require 'pymacs)
(setenv "PYTHONPATH"
        (concat
         ;;         (getenv "PYTHONPATH")
         (concat path-separator br-path "el-get/pymacs/")
         (concat path-separator br-path "el-get/rope/")
         (concat path-separator br-path "el-get/ropemode/")
         (concat path-separator br-path "el-get/ropemacs/")
         path-separator
         )
        )

;; this need a long time to load. I don't know why.
(pymacs-load "rope" "rope-")
(pymacs-load "ropemode" "rope-")
(pymacs-load "ropemacs" "rope-")

(add-hook 'python-mode-hook
  '(lambda ()
     ;; Initialize Rope                                       
     (ropemacs-mode)

     ;; Variables
     ;; (setq ropemacs-enable-autoimport t)
     (setq ropemacs-guess-project t)

     (setq imenu-default-create-index-function 'py-imenu-create-index-new)
     ;; virtualenv
     ;;(require 'virtualenv)
     
     ;; Hilight-indentation
     (require 'highlight-indentation)
     (highlight-indentation-on)
))


;;zencoding and django-html
(add-hook 'django-html-mode-hook '(lambda ()
                                    (zencoding-mode)
                                    (flyspell-mode-off)
                                    (yas/minor-mode)
                                    (yas/load-directory "~/.emacs.d/el-get/django-mode/snippets/")))
(add-to-list 'auto-mode-alist '("\\.html$" . django-html-mode))



(provide 'br-python)

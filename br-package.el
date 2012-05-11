(if (string-match "\s23" (emacs-version))
    ;; emacs 23
    (load-file (concat br-path "package.el"))
  ;;else
  ;;do nothing
  )

(require 'package)

;; Add the original Emacs Lisp Package Archive
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/"))
;; Add the user contributed repository
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)


(when (not package-archive-contents)
  (package-refresh-contents))


;;(defvar color-theme-packages '(color-theme color-theme-github color-theme-solarized pastels-on-dark-theme django-theme pastels-on-dark-theme)
;;  "A list of packages about color themes."
;;  )


;; (defvar anything-packages '(anything anything-complete anything-extension anything-config anything-match-plugin)
;;   "A list of anything packages.")
(defvar helm-packages '(helm))

(defvar python-packages '(python-mode python-pep8 python-pylint pony-mode))

(defvar other-packages '(coffee-mode flymake-coffee less-css-mode  multi-term undo-tree yasnippet iy-go-to-char yaml-mode markdown-mode applescript-mode js2-mode zenburn-theme auto-complete)
  "A list of other packages.")

(defvar esk-packages '(idle-highlight-mode smex paredit elisp-slime-nav)
  "A list package requried by emacs starter kit.")

(dolist (p (append  helm-packages python-packages esk-packages other-packages))
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'br-package)

(if (string-match "\s24" (emacs-version))
    (setq emacs-24 t)
  ;;else
  (setq emacs-24 nil)
  )

(if (not emacs-24)
    (load-file (concat br-path "package.el"))
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


(defvar emacs-theme-packages '(ir_black-theme twilight-theme zenburn-theme molokai-theme)
 "A list of packages about emacs themes."
 )


;; (defvar anything-packages '(anything anything-complete anything-extension anything-config anything-match-plugin)
;;   "A list of anything packages.")
(defvar helm-packages '(helm helm-projectile))

(defvar python-packages '(python-mode python-pep8 python-pylint pony-mode))

(defvar other-packages '(coffee-mode flymake-coffee less-css-mode  multi-term undo-tree yasnippet iy-go-to-char yaml-mode markdown-mode applescript-mode js2-mode auto-complete magit)
  "A list of other packages.")

(defvar esk-packages '(idle-highlight-mode smex paredit elisp-slime-nav)
  "A list package requried by emacs starter kit.")

(dolist (p (append emacs-theme-packages  helm-packages python-packages esk-packages other-packages))
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'br-package)

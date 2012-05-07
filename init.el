;; My configuration file path.
;; ~/.emacs.d
(defconst br-path
  (file-name-directory (or load-file-name
                            (when (boundp 'bytecomp-filename) bytecomp-filename)
                            buffer-file-name)))
(add-to-list 'load-path br-path)

;; package.el settings
(require 'br-package)

;; functions
(require 'br-func)

;; misc from esk
(require 'br-misc)

;; el-get settings
(require 'br-el-get)

;; UI
(require 'br-ui)

;; Keybindings
(require 'br-keys)

;; org-mode
(require 'br-org)

;; python settings
(require 'br-python)

;; lisp settings
(require 'br-lisp)

;; other settings
(require 'br-other)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flyspell-default-dictionary "english")
 '(org-agenda-files (quote ("~/Dropbox/org/gtd.org")))
 '(org-directory "~/Dropbox/org/")
 '(org-mobile-directory "~/Dropbox/MobileOrg")
 '(org-mobile-files (list "~/Dropbox/org/gtd.org" "~/Dropbox/org/notes.org" "~/Dropbox/org/future.org" (quote (org-agenda-files))))
 '(org-mobile-inbox-for-pull "~/Dropbox/org/mobile.org")
 '(split-height-threshold nil)
 '(split-width-threshold 120))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; My configuration file path.
;; ~/.emacs.d
(defconst br-path
  (file-name-directory (or load-file-name
                            (when (boundp 'bytecomp-filename) bytecomp-filename)
                            buffer-file-name)))
(add-to-list 'load-path br-path)


;; functions
(require 'br-func)

;; package.el settings
(require 'br-package)

;; misc from esk
(require 'br-misc)

;; el-get settings
(require 'br-el-get)

;; UI
(require 'br-ui)

;; Keybindings
(require 'br-keys')

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
 '(ansi-color-names-vector ["#3f3f3f" "#cc9393" "#7f9f7f" "#f0dfaf" "#8cd0d3" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(custom-safe-themes (quote ("b7553781f4a831d5af6545f7a5967eb002c8daeee688c5cbf33bf27936ec18b3" "5727ad01be0a0d371f6e26c72f2ef2bafdc483063de26c88eaceea0674deb3d9" default)))
 '(fci-rule-color "#383838")
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

;; Add el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

;; show progress
(setq el-get-verbose t)


;; packages
(setq el-get-sources
      '(
        (:name taglist
               :type git
               :url "git://github.com/yuanotes/taglist.git"
               :features taglist
               )
        (:name projectile
               :type git
               :url "git://github.com/yuanotes/projectile.git"
               :features projectile)

        ;; (:name django-mode
        ;;        :type git
        ;;        :url "https://github.com/yuanotes/django-mode.git"
        ;;        )
        (:name django-mode
               :type git
               :url "git://github.com/myfreeweb/django-mode.git")
        (:name powerline
               :type git
               :url "git://github.com/yuanotes/powerline.git")
        ;; (:name wrap-region
        ;;        :type git
        ;;        :url "https://github.com/rejeep/wrap-region.git"
        ;;        )
        (:name sr-speedbar
               :type emacswiki
               )
        (:name rope
               :type hg
               :url "https://bitbucket.org/agr/rope" 
               )
        (:name ropemode
               :type http-tar
               :options ("xzf")
               :url "http://pypi.python.org/packages/source/r/ropemode/ropemode-0.1-rc2.tar.gz#md5=005556053583a81f248828adc646924d")

        (:name multiple-line-edit
               :type emacswiki
               :features multiple-line-edit
               )

        ;; (:name slime
        ;;        :type http-tar
        ;;        :options ("xzf")
        ;;        :url "http://common-lisp.net/project/slime/snapshots/slime-current.tgz"
        ;;        )
      )
)      
  
      
(setq my-packages
      (append
       '(el-get ropemacs switch-window color-theme-twilight zencoding-mode pymacs)
       (mapcar 'el-get-source-name el-get-sources)
       )
      )
      
(el-get 'sync my-packages)


(provide 'br-el-get)

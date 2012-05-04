;; Org
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)

(add-hook 'org-mode-hook
          (lambda ()
            (define-key org-mode-map (kbd "C-M-S-m")
              (lambda ()
                (interactive)
                (org-meta-return)
                (org-metaright)
                )
              ;; 按键新建子一级heading
              )))

(setq org-hide-leading-stars t
      ;; 隐藏多余的星号
      )

(setq org-enable-priority-commands nil)
      ;; 不用priority

(provide 'br-org)

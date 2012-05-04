;; As promised `anything-project-files'. This smattering of code
;; allows you to define and load projects. Projects, once loaded, will
;; be indexed for all interesting files, which will let you make an
;; `anything' command to rule them all.
;;
;; Note: This is not intended to be a robust Emacs package, just an
;; example. Aw-right?  <span class="goog_qs-tidbit goog_qs-tidbit-0">Good. Let's start.
;; The Common Lisp library for Emacs Lisp gives us keyword arguments
;; for defun*
(require 'cl)
 
(defvar projects (list) "This keeps track of all available projects.")
(defvar project (list) "And here's our current project.")
(defvar project-index (list) "This will store the project index of files.")
(defvar project-default-filetypes
  '("*.el" "*.rb" "*.py" "*.rb" "*.clj" "*.php" "*.js" "*.html")
  "Files for indexing.")
 
;; Before we can build `anything-project-files', we need to have an
;; idea of what a project is.  For the purposes of this post, a
;; project will have a name, a root directory, and a list of filetypes
;; we want to index. Change this default file list to suit your own
;; needs.
;;
;; By the way, `&key' gives us keyword arguments, you can use a symbol
;; or a list of the form `(keyname default-value)' to designate a
;; keyword.
;;
;; Anything candidates can be a list of `(DISPLAY . REAL)' pairs, so
;; we throw the name up front to serve as the `DISPLAY' component."
 
(defun* project-create (name &key root (indexed-files project-default-filetypes))
  "Add a project to the list or projects."

  (add-to-list 'projects
               (cons name
                     `((:name . ,name)
                       (:root . ,root)
                       (:indexed-files . ,indexed-files)))))

;; The handy, dandy function below makes it real easy to get a project
;; component in the form of `(project :root)' or `(project :name)'.
;; (Elisp is a Lisp-2, so function can have the same name as
;; variables.)
 
(defun project (key)
  (cdr (assoc key project)))
 
;; Here's the code that indexes our project.


;; (defun project-reindex ()
;;   "Update your projects index of files."
;;   (interactive)
;;   ;; Travel to the project root
;;   (cd (project :root))
;;   ;; Using our `indexed-files', create a string that we can toss into a
;;   ;; find command.  It'll look like "'*.el' -or -name '*.rb'...".
;;   ;;
;;   ;; For a big project, we don't want to be stuck waiting while it
;;   ;; indexes, so we have to do a little jig-hoolery to make this work
;;   ;; async. Firstly, that means keeping track of the current buffer,
;;   ;; and switching to a temporary one in which to do our work.
;;   (let* ((b (current-buffer)))
;;     ;; And here's our temp buffer.
;;     (switch-to-buffer "*project-index*")
;;     ;; I'll use `tramp-handle-shell-command' as it returns a process
;;     (let ((process (tramp-handle-shell-command
;;                     "find . -type f -name '*.el' &" (current-buffer))))
;;       ;; And that lets me set a sentinel (callback) for when the
;;       ;; process is complete
;;       (set-process-sentinel process 'project-load-index))
;;     (message "Indexing...")
;;     ;; The work has been started, so we switch back to where we were
;;     ;; when we called the command.
;;     (switch-to-buffer b)))

(defun project-reindex ()
  (interactive)
  (cd (project :root))

  (let* ((b (current-buffer))
         (pattern (mapconcat 'wrap-identity  (project :indexed-files) " -o -name ")))
    (switch-to-buffer "*project-index*")
    (shell-command
     (concat "find . -type f -name " pattern " &" ) (current-buffer))
    (project-load-index)
    (message "Indexing...")
    (switch-to-buffer b)))

(defun wrap-identity (str)
  "Add single quote to wrap str."
  (concat "'" str "'"))

(defun project-load-index ()
  (setq project-index
        (split-string
         (with-current-buffer "*project-index*"
           (buffer-string)))))


;; ;; Here's my callback function. `p' is the process and `s' is a
;; ;; message string, which I'll ignore here.
;; (defun project-load-index (p s)
;;   ;; Now we'll just split-string on newline for our process buffer.
;;   (setq project-index
;;         (split-string
;;          (with-current-buffer (process-buffer p)
;;            (buffer-string))))
;;   ;; Goodbye
;;   (kill-buffer (process-buffer p))
;;   (message "Indexing complete."))
 
;; We load the project by selecting from a list an anything
;; buffer. Nice.
(defun project-load ()
  (interactive)
  (setq project
        (anything
         '((name . "Load Project")
           (candidates . projects)
           ;; `anything' usually wants to do something with our selected candidate,
           ;; but here I'm just going to return it.
           (action . (("Return" . identity))))))
  ;; The project is set, let's index it.
  (project-reindex))
 
;; And finally, the payload.
(defun anything-project-files ()
  (interactive)
  (anything
   '((name . "Project Find File")
     (candidates . project-index)
     ;; `display-to-real' will take the filename selection and add our
     ;; project root before any action is performed on it.
     (display-to-real . (lambda (c) (concat (project :root) "/" c)))
     (type . file))))
 
;; Now we'll set up our `emacs-config' project, accepting defaults for `:indexed-files',
;; though we could certainly use `'("*.el")' if we wanted to.
(project-create "emacs-config"
                :root "~/.emacs.d/")
(project-create "sws-new"
                :root "~/SAE/sws-new/"
                :indexed-files '("*.py" "*.html" "*.css" "*.js" "*.less"))
 
;; And there you have it. Load your `emacs-config' project, give it
;; the old `M-x anything-project-files', and you're off to the races.
;;
;; Next steps:
;;
;; Once you've got project context, you can let your imagination run
;; wild coming up with project-related tasks Emacs could be doing for
;; you.
;;
;; Also `project-load' could do more, like tagging the project. Hell,
;; you could create an `anything-project-tags' command, which would
;; rock out pretty hard.
;;
;; Indexing (and tagging) might take a long time on large projects and
;; may not be necessary on every project load. One could consider
;; saving a project index file and loading from that until you
;; explicitly reindex. It'd be pretty simple, but I'll leave that up
;; to you.
;;
;; Until next time, buenos dias! Buenos Aires!

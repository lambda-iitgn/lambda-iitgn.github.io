(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; Initialize the package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install dependencies
(package-install 'htmlize)
(require 'ox-publish)
;;; Code:
(setq org-html-validation-link nil
      )
(setq org-publish-project-alist
      (list
       (list "lambda-iitgn.github.io"
	     :recursive t
	     :base-directory "./org-content"
	     :publishing-directory "./public"
	     :publishing-function 'org-html-publish-to-html
	     :with-author nil
	     :with-creator t
	     :with-latex t
	     :with-emphasize t
	     
	     :with-toc nil
	     :section-numbers nil
	     :time-stamp-file nil)))

(org-publish-all t)

(message "Build complete!")

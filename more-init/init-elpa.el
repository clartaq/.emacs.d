;;; package -- init-elpa
;;;
;;; Commentary:
;;; Initializes the package system.

;;; Code:

(require 'package)

(defun require-package (package)
  "If not already installed, install the specified PACKAGE.
This function has largely been superseded by 'use-package'."
  (if (package-installed-p package)
      t
    (progn
      (unless (assoc package package-archive-contents)
	(package-refresh-contents))
      (package-install package))))

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Install use-package in case it does not exist yet.  The use-pacakge
;; software will install all of the other packages as requred.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(provide 'init-elpa)
;;; init-elpa ends here

;;; package -- init-elpa
;;;
;;; Commentary:
;;; Initializes the package system.

;;; Code:

(message "Enter init-elpa.el")

(require 'package)

(setq package-enable-at-startup nil)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages") t)

(package-initialize)

(defun require-package (package)
  "If not already installed, install the specified PACKAGE.
This function has largely been superseded by 'use-package'."
  (if (package-installed-p package)
      t
    (progn
      (unless (assoc package package-archive-contents)
	(package-refresh-contents))
      (package-install package))))

;; This software will install all of the other packages as required.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(provide 'init-elpa)
;;; init-elpa ends here

;;; package -- init-elpa
;;;
;;; Commentary:
;;; Initializes the package system.

;;; Code:

(message "Enter init-elpa.el")

(require 'package)

(setq package-enable-at-startup nil)

;; Reworked to allow concurrent usage of multiple package repositories.
;; Higher priority are loaded in preference to lower priority, even if
;; the lower priority archive has a newer version.
(setq package-archives
      '(("GNU ELPA"     . "https://elpa.gnu.org/packages/")
        ("MELPA Stable" . "https://stable.melpa.org/packages/")
        ("MELPA"        . "https://melpa.org/packages/"))
      package-archive-priorities
      '(("MELPA Stable" . 10)
        ("GNU ELPA"     . 5)
        ("MELPA"        . 0)))

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

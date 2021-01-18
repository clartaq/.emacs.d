;;; package --- init-editing.el
;;;
;;; Commentary:
;;; This package just sets some things to make editing more convenient.

;;; Code:

(require 'init-elpa)

;; When you visit a file, point goes to the last place where it
;; was when you previously visited the same file.
;; http://www.emacswiki.org/emacs/SavePlace
(require 'saveplace)
(setq-default save-place t)
;; Keep track of saved places in '~/.emacs.d/places'.
(setq save-place-file (concat user-emacs-directory "places"))

;; Highlights matching parentheses.
(show-paren-mode 1)

;; Use rainbow delimiters to make nested parentheses easier to
;; match up visually.
(use-package rainbow-delimiters
  :ensure t
  :config (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; Various types of syntax checking.
(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode)
  (setq sentence-end-double-space nil))

;; Highlight current line
(global-hl-line-mode 1)

(define-key global-map (kbd "RET") 'newline-and-indent)

;; Shows a list of buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Emacs can automatically create backup files. This tells Emacs to
;; put all backups in ~/.emacs.d/backups. More info:
;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Backup-Files.html
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))

;; Automatically save all buffers every few seconds.
(use-package real-auto-save
  :ensure t
  :config
  ;; Ten seconds is the default value. It is set again here just
  ;; for documentation purposes.
  (setq real-auto-save-interval 10)
  (setq real-auto-save-use-idle-timer nil))

(defun toggle-comment-on-line ()
  "Comment or uncomment current line."
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(global-set-key (kbd "C-;") 'toggle-comment-on-line)

;; Change C-a to toggle between the beginning of the line and the beginning of
;; code on an indented lines.
;; Saw this in an answer at:
;; https://stackoverflow.com/questions/6035872/moving-to-the-start-of-a-code-line-emacs
(defun beginning-of-line-or-indentation ()
  "Move to beginning of line, or indentation."
  (interactive)
  (if (bolp)
      (back-to-indentation)
    (beginning-of-line)))

;; I like the way IntelliJ and most Windows-based text editors
;; handle the home and end key, moving the cursor to the
;; beginning or end of the line, not the document.
(global-set-key (kbd "C-a") 'beginning-of-line-or-indentation)
(global-set-key (kbd "<home>") 'beginning-of-line-or-indentation)

(global-set-key (kbd "<end>") 'end-of-line)

;; I like the way IntelliJ lets me indent (format) the entire buffer
;; with a single keystroke. Same thing here. I prefer this to the
;; default "C-h" "\" since this doesn't lose the cursor position.
(defun indent-buffer ()
  "Indent the entire buffer with a single keystroke."
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))
(global-set-key (kbd "M-s-l") 'indent-buffer)

(provide 'init-editing)
;;; init-editing.el ends here

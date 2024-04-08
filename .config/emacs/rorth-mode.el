;;; rorth-mode.el --- major mode for rorth  -*- lexical-binding: t; -*-

(defvar rorth-mode-syntax-table nil "Syntax table for rorth-mode")
(setq rorth-mode-syntax-table
			(let ((syn-table (make-syntax-table)))
				(modify-syntax-entry ?\\ "<" syn-table)
				(modify-syntax-entry ?\n ">" syn-table)
				(modify-syntax-entry ?- "." syn-table)
				syn-table))

(setq rorth-highlights
			'(("while\\|end\\|if\\|else" . font-lock-type-face)
				;; ("+\\|-\\|*\\|=\\|<\\|>\\|!" . font-lock-constant-face)
				("[0-9]" . font-lock-constant-face)
				("\\-- [a-zA-Z ]+ \\;" . font-lock-comment-face)
				("\\-- [a-zA-Z ]+ \)" . font-lock-comment-face)
				(";" . font-lock-function-name-face)
				("\\: [a-zA-Z]+" . font-lock-function-name-face)))

(define-derived-mode rorth-mode prog-mode "rorth"
	"Major mode for editing Rorth"
	(setq font-lock-defaults '(rorth-highlights))
	(setq-local comment-start "\\")
	(set-syntax-table rorth-mode-syntax-table))

(add-to-list 'auto-mode-alist '("\\.rorth\\'" . rorth-mode))

(provide 'rorth-mode)

;;; rorth-mode.el ends here

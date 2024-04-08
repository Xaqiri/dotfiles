(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(let ((ghcup-path (expand-file-name "~/.ghcup/ghc/9.2.7/bin")))
  (setenv "PATH" (concat ghcup-path ":" (getenv "PATH")))
  (add-to-list 'exec-path ghcup-path))

(defun increase-right ()
  (interactive)
  (if (window-right (selected-window))
      (enlarge-window-horizontally 5)
    (enlarge-window-horizontally -5)))

(defun increase-left ()
  (interactive)
  (if (window-right (selected-window))
      (enlarge-window-horizontally -5)
    (enlarge-window-horizontally 5)))

(defun increase-up ()
  (interactive)
  (if (window-in-direction 'above)
      (enlarge-window 5)
    (enlarge-window -5)))

(defun increase-down ()
  (interactive)
  (if (window-in-direction 'below)
      (enlarge-window 5)
    (enlarge-window -5)))

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  ;; (load-theme 'doom-tokyo-night t)
  (doom-themes-org-config))

(use-package emacs
  :hook
  (prog-mode . display-line-numbers-mode)
	(prog-mode . electric-pair-mode)
  (Info-mode . visual-line-mode)
  :init
  (defun dir () (interactive) (dired "./"))
  (defun sprog () (interactive) (dired "~/programming/"))
  (defun snotes() (interactive) (dired "~/notes/vault/"))
  (defun init () (interactive) (find-file user-init-file))
  (defun theme () (interactive) (find-file "~/.config/emacs/xaqiri-theme.el"))
  (when scroll-bar-mode
    (scroll-bar-mode -1))
  (line-number-mode 1)
  (menu-bar--display-line-numbers-mode-relative)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (setq visible-bell nil
	ring-bell-function (lambda ()
			     (invert-face 'mode-line)
			     (run-with-timer 0.1 nil #'invert-face 'mode-line)))
  (setq custom-file (locate-user-emacs-file "custom-vars.el"))
  (setq make-backup-files nil)
  (load custom-file 'noerror 'nomessage)
  (column-number-mode)
  (setq inhibit-splash-screen t)
  (add-to-list 'default-frame-alist '(undecorated-round . t))
  (fido-vertical-mode)
  (setq treesit-font-lock-level 4)
  (setq toggle-word-wrap 1)
	(setq cursor-in-non-selected-windows nil)
	(setq visible-cursor nil)
	(setq evil-visual-state-cursor 'hbar
		  evil-normal-state-cursor 'box
		  evil-insert-state-cursor 'bar)
	(global-hl-line-mode t)
  (load-theme 'xaqiri)
  (set-face-attribute 'default nil :font "Hack Nerd Font" :height 220 :weight 'semi-bold))

(use-package eldoc
  :init
  (global-eldoc-mode))

(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (global-treesit-auto-mode))

(setq treesit-language-source-alist
      '((go "https://github.com/tree-sitter/tree-sitter-go")
        (gomod "https://github.com/camdencheek/tree-sitter-go-mod")
		(gleam "https://github.com/gleam-lang/tree-sitter-gleam")))

(use-package prog-mode
	:config
	(add-hook 'before-save-hook 'eglot-format))

;; (use-package forth-mode
;; 	:init
;; 	(add-to-list 'auto-mode-alist '("\\.rorth\\'" . forth-mode)))

(use-package dart-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.dart\\'" . dart-mode)))

(use-package go-ts-mode
  :hook
  (go-ts-mode . display-line-numbers-mode)
  :init
  (add-to-list 'auto-mode-alist '("\\.go\\'" . go-ts-mode))
  (add-to-list 'auto-mode-alist '("go\.mod\\'" go-mod-ts-mode))
  :config
  (setq tab-width 2)
  (setq go-ts-mode-indent-offset 2))

(use-package rust-ts-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-ts-mode))
  :config
  (setq tab-width 4)
  (setq rust-ts-mode-indent-offset 4))

(use-package zig-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.zig\\'" . zig-mode))
  :config
  (setq tab-width 4)
  (setq zig-mode-indent-offset 4))

(use-package general
  :ensure t
  :config
  (general-evil-setup t)
  (general-create-definer nvim
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "C-SPC")
  (imap
    "j"
    (general-key-dispatch 'self-insert-command
      "k" 'evil-normal-state))
  (nvim
    "<escape>" 'keyboard-escape-quit
    "C-t" 'vterm
    "SPC x" 'execute-extended-command :which-key "execute command"
    "SPC h" '(:ignore t :which-key "help")
    "SPC hf" 'describe-function
    "SPC hv" 'describe-variable
    "SPC hk" 'describe-key
    "/" 'comment-line
    "a" 'mark-whole-buffer
    "f" '(:ignore t :which-key "file")
    "ff" 'find-file
    "fb" 'switch-to-buffer
    "fo" 'org-open-at-point
    "fj" '((lambda () (interactive) (text-scale-decrease 1)) :wk "decrease font size")
    "fk" '((lambda () (interactive) (text-scale-increase 1)) :wk "increase font size")
    "fl" '((lambda () (interactive) (text-scale-increase 0)) :wk "reset font size")
    "h" 'evil-window-left
    "j" 'evil-window-down
    "k" 'evil-window-up
    "l" 'evil-window-right
    "e" 'dir
    "s" '(:ignore t :which-key "split")
    "ss" '(split-window-below :wk "split below")
    "sv" '(split-window-right :wk "split right")
    "sh" '(increase-left :wk "increase left")
    "sj" '(increase-down :wk "increase down")
    "sk" '(increase-up :wk "increase up")
    "sl" '(increase-right :wk "increase right")
    "sd" '(evil-window-delete :wk "split close")
    "sm" '(maximize-window :wk "maximize window")
    "s=" '(balance-windows :wk "balance windows")
    "b" '(:ignore t :which-key "buffer")
    "bd" 'kill-current-buffer
    "bk" 'kill-buffer
    "g" '(:ignore t :which-key "goto")
    "gb" 'bookmark-jump
    "t" '(:ignore t :wk "tabs")
    "tt" '(tab-new :wk "new tab")
    "td" '(tab-close :wk "close tab")
    "tp" '(tab-previous :wk "previous tab")
    "tn" '(tab-next :wk "next tab")
    "c" '(:ignore t :wk "code")
    "cs" '(shell-command :wk "shell command")
	"cc" '(compile :wk "compile")))

(use-package which-key
  :ensure t
  :commands (which-key-mode)
  :init
  (which-key-mode)
  :general
  (nvim
    "?" 'which-key-show-top-level)
  :config
  (setq which-key-idle-delay 0.2))

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1)
  (evil-define-key 'normal 'global (kbd "gl") 'evil-end-of-line)
  (evil-define-key 'normal 'global (kbd "gh") 'evil-beginning-of-line))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package eglot
  :hook (prog-mode . eglot-ensure)
  :general
  (:states '(normal visual emacs)
		   :keymaps 'eglot-mode-map
		   :prefix "SPC"
		   "ca" 'eglot-code-actions
		   "co" 'eglot-code-action-organize-imports
		   "cr" 'eglot-rename
		   "cf" 'eglot-format
		   "cc" '(compile :wk "compile")))

;; :bind (:map
;; 	 eglot-mode-map
;; 	 ("C-c c a" . eglot-code-actions)
;; 	 ("C-c c o" . eglot-code-actions-organize-imports)
;; 	 ("C-c c r" . eglot-rename)
;; 	 ("C-c c f" . eglot-format)))

(use-package company
  :ensure t
  :commands (global-company-mode)
  :init
  (global-company-mode)
  :custom
  (company-tooltip-align-annotations 't)
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.1))

(use-package auctex
  :ensure t
  :hook
  (LaTeX-mode . turn-on-prettify-symbols-mode)
  (LaTeX-mode . turn-on-flyspell))

(use-package vterm
  :ensure t)

(use-package elisp-mode
  :general
  (:states '(normal visual emacs)
		   :keymaps 'emacs-lisp-mode-map
		   :prefix "SPC"
		   "ce" '(elisp-eval-region-or-buffer :wk "eval region or buffer")
		   "cf" '(indent-region :wk "indent region")))

(use-package org
  :hook
  (org-mode . org-indent-mode)
  (org-mode . visual-line-mode)
  (org-mode . org-modern-mode)
  ;; (org-mode . custom-org)
  :general
  (:states '(normal visual emacs)
		   :keymaps 'org-mode-map
		   :prefix "SPC"
		   "o" '(:ignore t :which-key "org")
		   "ol" '(org-insert-link :wk "insert link")
		   "os" 'snotes)
  :init
  (setq org-hide-emphasis-markers t))

(use-package markdown-mode
  :ensure t
  :magic "\\.md\\'"
  :general
  (:states '(normal visual emacs)
		   :keymaps 'markdown-mode-map
		   :prefix "SPC"
		   "cl" '(markdown-insert-link :wk "insert link")
		   "c RET" '(markdown-toggle-markup-hiding :wk "toggle markup hiding")
		   "cd" '(markdown-do :wk "do something sensible based on context at point")
		   "co" '(markdown-follow-link-at-point :wk "follow link at point"))
  :hook
  (markdown-mode . nb/markdown-unhighlight)
  :config
  (setq markdown-indent-on-enter 'indent-and-new-item)
  (setq markdown-fontify-code-blocks-natively t)
  (defvar nb/current-line '(0 . 0)
    "(start . end) of current line in current buffer")
  (make-variable-buffer-local 'nb/current-line)

  (defun nb/unhide-current-line (limit)
    "Font-lock function"
    (let ((start (max (point) (car nb/current-line)))
          (end (min limit (cdr nb/current-line))))
      (when (< start end)
        (remove-text-properties start end
								'(invisible t display "" composition ""))
        (goto-char limit)
        t)))

  (defun nb/refontify-on-linemove ()
    "Post-command-hook"
    (let* ((start (line-beginning-position))
           (end (line-beginning-position 2))
           (needs-update (not (equal start (car nb/current-line)))))
      (setq nb/current-line (cons start end))
      (when needs-update
        (font-lock-fontify-block 3))))

  (defun nb/markdown-unhighlight ()
    "Enable markdown concealling"
    (interactive)
    (markdown-toggle-markup-hiding 'toggle)
    (font-lock-add-keywords nil '((nb/unhide-current-line)) t)
    (add-hook 'post-command-hook #'nb/refontify-on-linemove nil t)))

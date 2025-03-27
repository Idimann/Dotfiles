(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
	("elpa" . "https://elpa.gnu.org/packages/")
	("nongnu" . "https://elpa.nongnu.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-and-compile
  (setq use-package-always-ensure t
	use-package-expand-minimally t))

(use-package spaceway-theme
  :ensure nil
  :load-path "spaceway/"
  :config'
  (global-hl-line-mode t))

(use-package almost-mono-themes)

(use-package org-superstar
  :after org
  :hook (org-mode . org-superstar-mode))

(use-package vertico

  :init (vertico-mode))

(use-package emacs
  :custom (enable-custom-minibuffers t)
  (read-extended-command-predicate #'command-completion-default-include-p)
  (minibuffer-prompt-properties
   '(read-only t cursor-intangible face minibuffer-prompt)))

(setq make-backup-files nil)

(setq display-line-numbers 'relative)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(column-number-mode 1)
(show-paren-mode 1)
(global-display-line-numbers-mode 1)
(setq display-line-numbers 'relative)

(setq scroll-step 5
      scroll-conservatively 10)

(defun reload-config ()
  (interactive)
  (load-file "~/.config/emacs/init.el"))
(global-set-key (kbd "C-c l") 'reload-config)

(global-set-key (kbd "C-,") 'duplicate-line)
(global-set-key (kbd "M-n") 'scroll-up)
(global-set-key (kbd "M-p") 'scroll-down)

(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup)
(defun my-minibuffer-setup ()
  (set (make-local-variable 'face-remapping-alist)
       '((default :height 2.0))))

(use-package tree-sitter)
(use-package tree-sitter-langs)
(global-tree-sitter-mode)

(load-theme 'spaceway t)
;;    (load-theme 'almost-mono-black t)
;;  (set-frame-parameter nil 'alpha-background 80)
(set-frame-parameter nil 'alpha-background 100)

(set-frame-font "Iosevka" nil t)

(setq org-hide-emphasis-markers t)

(let* ((variable-tuple
        (cond ((x-list-fonts "Iosevka")         '(:font "Iosevka"))
              (nil (warn "Cannot find Iosevka (idk what to do)."))))
       (base-font-color     (face-foreground 'default nil 'default))
       (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

  (custom-theme-set-faces
   'user
   `(org-level-8 ((t (,@headline ,@variable-tuple))))
   `(org-level-7 ((t (,@headline ,@variable-tuple))))
   `(org-level-6 ((t (,@headline ,@variable-tuple))))
   `(org-level-5 ((t (,@headline ,@variable-tuple))))
   `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
   `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
   `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
   `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
   `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))

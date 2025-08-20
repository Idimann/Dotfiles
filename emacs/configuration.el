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
  :load-path "spaceway/")

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

(use-package which-key
  :init (which-key-mode 1)
  :config
  (setq which-key-side-window-location 'bottom
	which-key-sort-order #'which-key-key-order-alpha
	which-key-sort-uppercase-first nil
	which-key-add-column-padding 1
	which-key-max-display-columns nil
	which-key-min-display-lines 6
	which-key-side-window-slot -10
	which-key-side-window-max-height 0.25
	which-key-idle-delay 0.8
	which-key-max-description-length 25
	which-key-allow-imprecise-window-fit nil))

(use-package consult)

(use-package doom-modeline)
(setq doom-modeline-height 40)
(setq doom-modeline-buffer-modification-icon nil)
(doom-modeline-mode)

(setq inhibit-startup-screen t)

(setq make-backup-files nil)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(column-number-mode 1)
(show-paren-mode 1)
(setq display-line-numbers 'relative)
(global-display-line-numbers-mode 1)

(setq scroll-step 5
      scroll-conservatively 10)

(defun reload-config ()
  (interactive)
  (load-file "~/.config/emacs/init.el"))
(global-set-key (kbd "C-c l") 'reload-config)

(global-set-key (kbd "C-,") 'duplicate-line)

(mouse-wheel-mode -1)

(global-set-key (kbd "C-c c") 'compile)

(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup)
(defun my-minibuffer-setup ()
  (set (make-local-variable 'face-remapping-alist)
       '((default :height 2.0))))

(defun my-isearch-message (&optional c-q-hack ellipsis)
  ;; Generate and print the message string.
  (let ((cursor-in-echo-area ellipsis)
        (m isearch-message)
        (fail-pos (isearch-fail-pos t)))
    ;; Highlight failed part
    (when fail-pos
      (setq m (copy-sequence m))
      (add-text-properties fail-pos (length m) '(face isearch-fail) m)
      ;; Highlight failed trailing whitespace
      (when (string-match " +$" m)
        (add-text-properties (match-beginning 0) (match-end 0)
                             '(face trailing-whitespace) m)))
    (setq m (concat
             (isearch-message-prefix ellipsis isearch-nonincremental)
             m
             (isearch-message-suffix c-q-hack)))
    (if c-q-hack m (let ((message-log-max nil)) (message "%s" (propertize m 'face  '(:inherit default :height 2.0)))))))

(setq isearch-message-function #'my-isearch-message)

(use-package tree-sitter)
(use-package tree-sitter-langs)
(global-tree-sitter-mode)

(load-theme 'spaceway t)
;;    (load-theme 'almost-mono-black t)
;;  (set-frame-parameter nil 'alpha-background 80)
(set-frame-parameter nil 'alpha-background 100)

(set-frame-font "Iosevka-12" nil t)
;;  (setq-default line-prefix "⬫")

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

; packages
(require 'package)
(add-to-list 'package-archives '("melpa" .  "http://melpa.org/packages/") 'APPEND)
(package-initialize)
(use-package exec-path-from-shell :ensure t)
(exec-path-from-shell-initialize) ; for mac TODO: make an alternative

; config
(setq delete-old-versions -1 )		; delete excess backup versions silently
(setq version-control t )		; use version control
(setq vc-make-backup-files t )		; make backups file even when in version controlled dir
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")) ) ; which directory to put backups file
(setq vc-follow-symlinks t )				       ; don't ask for confirmation when opening symlinked file
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)) ) ;transform backups file name
(setq inhibit-startup-screen t )	; inhibit useless and old-school startup screen
(setq ring-bell-function 'ignore )	; silent bell when you make a mistake
(setq coding-system-for-read 'utf-8 )	; use utf-8 by default
(setq coding-system-for-write 'utf-8 )
(setq sentence-end-double-space nil)	; sentence SHOULD end with only a point.
(setq default-fill-column 80)		; toggle wrapping text at the 80th character
(setq initial-scratch-message "dont write any javascript today") ; print a default message in the empty scratch buffer opened at startup

; which-key
(use-package which-key :ensure t
  :init
  (which-key-mode)
  :config
  (which-key-setup-side-window-right-bottom)
  (setq which-key-sort-order 'which-key-key-order-alpha
      which-key-side-window-max-width 0.33
      which-key-idle-delay 2)
  )

; general keybinds
; (global-set-key (kbd "M-a") 'backward-char) ; Alt+a

; general leaders
(use-package general :ensure t
  :config
  (general-evil-setup t)
  (general-define-key
   :states '(normal)
   :prefix "\\"
   "em" '((lambda() (interactive)(find-file "~/.emacs.d/init.el")) :which-key "Opens init.el")
   "so" '(load-file "~/.emacs.d/init.el" :which-key "Loads init.el")
   "o" '((lambda() (interactive)(find-file "~/todo.org")) :which-key "Loads todo.org")
   )
)

; style
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-default-font "Source Code Pro 14")
(global-linum-mode t)
(add-to-list 'default-frame-alist '(fullscreen . maximized)) ;starts fullscreen

; languages
; js/jsx
(use-package rjsx-mode :ensure t
  :config
  (add-to-list 'auto-mode-alist '(".*\\.js\\'" . rjsx-mode)))
;(add-hook 'rjsx-mode-hook
          ;(lambda ()
            ;(setq indent-tabs-mode nil) ;;Use space instead of tab
            ;(setq js-indent-level 2) ;;space width is 2 (default is 4)
            ;(setq js2-strict-missing-semi-warning nil))) ;;disable the semicolon warning

; theme
; only for custom
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'hybrid t)

(use-package powerline :ensure t)
(powerline-default-theme)

; evil mode
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)
(with-eval-after-load 'evil-maps
  (define-key evil-normal-state-map (kbd "C-n") nil)
  (define-key evil-visual-state-map (kbd "C-n") nil))

; org mode
(use-package org :ensure t)

; select
(use-package evil-multiedit :ensure t
  :config
  (define-key evil-normal-state-map (kbd "C-n") 'evil-multiedit-match-and-next)
  (define-key evil-visual-state-map (kbd "C-n") 'evil-multiedit-match-and-next)
  (define-key evil-visual-state-map (kbd "C-S-N") 'evil-multiedit-match-all))

; jj
(use-package evil-escape
  :ensure t
  :config
  (setq-default evil-escape-key-sequence "jj")
  (push 'visual evil-escape-excluded-states)
  (setq-default evil-escape-delay 0.2))
(evil-escape-mode)

; file search
(use-package helm
  :ensure t
  :config
  (helm-mode 1)
  (setq helm-autoresize-mode t)
  (setq helm-buffer-max-length 40)
  (define-key helm-map (kbd "C-j") 'helm-next-line)
  (define-key helm-map (kbd "C-k") 'helm-previous-line)
  (global-set-key (kbd "M-x") #'helm-M-x))

(use-package projectile
  :ensure t
  :defer t
  :config
  (projectile-global-mode))

(use-package helm-rg :ensure t)
(use-package helm-projectile
  :bind (("C-S-P" . helm-projectile-switch-project)
         :map evil-normal-state-map
         ("C-p" . helm-projectile))
  :ensure t
  :config)

; generated garbage
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (badger-theme rjsx-mode evil-multiedit helm-rg use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)

(add-to-list 'package-archives '("melpad" . "https://melpa.org/packages/"))

(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;; Add packages here
(defvar packages-to-install
  '(evil
    projectile
    expand-region
    evil-quickscope
    helm
    helm-projectile
    json-mode
    magit
    puppet-mode
    terraform-mode
    yaml-mode
    zenburn-theme))

(package-initialize)

(unless (file-exists-p package-user-dir)
  (package-refresh-contents))

(dolist (package-name packages-to-install)
  (unless (package-installed-p package-name)
    (package-install package-name)))

;; Set theme
(load-theme 'zenburn t)

;; Enable mouse in terminal
(xterm-mouse-mode 1)
;; Hide the toolbar in GUI
(tool-bar-mode -1)
;; Set window size
(if (display-graphic-p)
  (progn
    (add-to-list 'default-frame-alist '(height . 60))
    (add-to-list 'default-frame-alist '(width . 150))))
;; Show line numbers
(global-linum-mode 1)
;; Don't show splash screen
(setq inhibit-startup-message t)

; Disable warning on opening symlinks to version-controlled files
(setq vc-follow-symlinks t)

;; Indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq js-indent-level 2)
;; Delete trailing whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Backup files in a dedicated directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; Helm
(helm-mode 1)
;; Fuzzy matching on M-x
(global-set-key (kbd "M-x") 'helm-M-x)
(setq helm-M-x-fuzzy-match t)
;; Fuzzy matching on help (describe-function, describe-variable, among others)
(setq helm-mode-fuzzy-match t)
;; Evil quickscope
(global-evil-quickscope-always-mode 1)

;; Projectile
(projectile-global-mode)
(helm-projectile-on)
;; Expand-region
(global-set-key (kbd "C-=") 'er/expand-region)


(provide '.emacs)
;;; .emacs ends here

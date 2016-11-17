(require 'package)

(add-to-list 'package-archives '("melpad" . "https://melpa.org/packages/"))

(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;; Add packages here
(defvar packages-to-install
  '(ag
    avy
    coffee-mode
    copyit
    expand-region
    evil
    evil-exchange
    evil-quickscope
    evil-visualstar
    flycheck
    evil-rails
    github-browse-file
    git-gutter
    helm
    helm-ag
    helm-gtags
    helm-projectile
    json-mode
    magit
    magit-gh-pulls
    evil-magit
    evil-surround
    projectile
    projectile-rails
    puppet-mode
    rbenv
    rspec-mode
    ruby-end
    sass-mode
    terraform-mode
    yaml-mode
    which-key
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
;; Show column
(setq column-number-mode t)
;; Highlight cursor
(global-hl-line-mode 1)
;; Show parenthesis
(show-paren-mode 1)
;; Don't show splash screen
(setq inhibit-startup-message t)

; Disable warning on opening symlinks to version-controlled files
(setq vc-follow-symlinks t)
; Disable warning on opening file in a project with big ctags
(setq large-file-warning-threshold nil)

;; Indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)
;; Delete trailing whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Keep track of recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 150)
(setq recentf-max-saved-items 500)
(global-set-key "\C-x\ \C-r" 'helm-recentf)
;; Keep track of window configurations
(when (fboundp 'winner-mode)
  (winner-mode 1))
;; Keep track of previous mini-buffer commands (notably compile)
(savehist-mode 1)

;; VIM-like behavior with underscore and word-selection/navigation commands
;; For ruby (see https://github.com/syl20bnr/spacemacs/blob/develop/doc/FAQ.org#include-underscores-in-word-motions)
(add-hook 'ruby-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))

;; Backup files in a dedicated directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; Helm
(helm-mode 1)
;; Fuzzy matching on M-x
(global-set-key (kbd "M-x") 'helm-M-x)
(setq helm-M-x-fuzzy-match t)
;; Fuzzy matching on help (describe-function, describe-variable, among others)
(setq helm-mode-fuzzy-match t)
;; Do I even use helm-apropos at all if not bound to describe-* keys?
;; Use helm-apropos instead of default
(global-set-key (kbd "C-h a") 'helm-apropos)
(setq helm-apropos-fuzzy-match t)
;; History of recent files
;;(global-set-key (kbd "C-x C-f") 'helm-find-files)
;;(setq helm-ff-file-name-history-use-recentf t)

;; Evil
;; These needs be set before requiring evil
;; Indent for < and >. I wish it was guessed...
(setq evil-want-C-u-scroll t)
(setq evil-shift-width 2)
(setq evil-search-module 'evil-search)
(evil-mode 1)

;; Evil quickscope
(global-evil-quickscope-always-mode 1)

;; Evil visualstar
(global-evil-visualstar-mode)

;; Evil exchange
(require 'evil-exchange)
(evil-exchange-install)

;; Preserve emacs default C-d (delete next char) in evil insert mode
;; (evil replaces it with evil-shift-left-line)
(define-key evil-insert-state-map (kbd "C-d") nil)

;; Some vim-unimpaired shortcuts for Evil
;; (from https://github.com/syl20bnr/spacemacs/tree/master/layers/%2Bvim/unimpaired)
(define-key evil-normal-state-map (kbd "[ SPC") (lambda() (interactive)(evil-insert-newline-above) (forward-line)))
(define-key evil-normal-state-map (kbd "] SPC") (lambda() (interactive)(evil-insert-newline-below) (forward-line -1)))
(defun unimpaired/paste-above ()
  (interactive)
  (evil-insert-newline-above)
  (evil-paste-after 1))
(defun unimpaired/paste-below ()
  (interactive)
  (evil-insert-newline-below)
  (evil-paste-after 1))
(define-key evil-normal-state-map (kbd "[ p") 'unimpaired/paste-above)
(define-key evil-normal-state-map (kbd "] p") 'unimpaired/paste-below)
;; Better than default C-x left/right
(define-key evil-normal-state-map (kbd "[ b") 'previous-buffer)
(define-key evil-normal-state-map (kbd "] b") 'next-buffer)

;; Some vinegar.vim shortcuts for Evil
(define-key evil-normal-state-map (kbd "-") 'dired-current-directory)

;; Evil-surround
(require 'evil-surround)
(global-evil-surround-mode 1)

;; Projectile
(projectile-global-mode)
(helm-projectile-on)
;; Make projectile find-file faster
(setq projectile-enable-caching t)
;; Invalidate cache on startup
(clrhash projectile-projects-cache)

;; Projectile Rails
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(define-key evil-normal-state-map (kbd "g f") 'projectile-rails-goto-file-at-point)

;; Rbenv mode (For Rails projectile)
;; Install dir needs to be set before requiring rbenv
(setq rbenv-installation-dir "/opt/boxen/rbenv")
(require 'rbenv)
(global-rbenv-mode)


;; Rspec mode
(require 'rspec-mode)
;; Auto-scroll spec
(setq compilation-scroll-output t)
;; Allow running binding.pry. Hit `C-x C-q` on breakpoint to run `inf-ruby`
(add-hook 'after-init-hook 'inf-ruby-switch-setup)
;; Hide compilation window when successful tests
;; (from http://emacs.stackexchange.com/questions/62/hide-compilation-window/336)
 (add-hook 'compilation-finish-functions
           (lambda (buf strg)
             (if (null (string-match ".*exited abnormally.*" strg))
                (let ((win  (get-buffer-window buf 'visible)))
                (when win (delete-window win))))))

;; Evil Rails (requires Projectile Rails)
(require 'evil-rails)

;; Emacs-ag
(evil-ex-define-cmd "Ack" 'helm-ag-project-root)
(define-key evil-ex-map "Ack " 'helm-ag-project-root)


;; Magit
(require 'evil-magit)
;; Import repos list from Projectile
(global-set-key (kbd "C-x g") 'magit-status)
(eval-after-load "projectile"
  '(setq magit-repository-directories (mapcar #'directory-file-name
                                              (cl-remove-if-not (lambda (project)
                                                                        (file-directory-p (concat project "/.git/")))
                                                                (projectile-relevant-known-projects)))

         magit-repository-directories-depth 1))

;; Magit GH Pulls
(require 'magit-gh-pulls)
(add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls)

;; Auto-complete
(ac-config-default)

;; Web mode
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-ac-sources-alist
      '("html" . (ac-source-html-tag
                  ac-source-html-attr
                  ac-source-html-attrv)))

;; Expand-region
(global-set-key (kbd "C-=") 'er/expand-region)

;; Git gutter
(global-git-gutter-mode +1)

;; Zoom window
(require 'zoom-window)
(global-set-key (kbd "C-x C-z") 'zoom-window-zoom)
(setq zoom-window-mode-line-color "DarkGreen")

;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Org mode
(setq org-log-done t)

;; Which key
(which-key-mode)

;; Ruby end
(require 'ruby-end)

;; smartparens
(require 'smartparens-config)

(provide '.emacs)
;;; .emacs ends here

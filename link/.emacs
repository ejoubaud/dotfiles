(require 'package)

(add-to-list 'package-archives '("melpad" . "https://melpa.org/packages/"))

(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;; Add packages here
(defvar packages-to-install
  '(evil
    zenburn-theme))

(package-initialize)

(unless (file-exists-p package-user-dir)
  (package-refresh-contents))

(dolist (package-name packages-to-install)
  (unless (package-installed-p package-name)
    (package-install package-name)))

; Set theme
(load-theme 'zenburn t)

; Enable mouse in terminal
(xterm-mouse-mode 1)
; Hide the toolbar
(tool-bar-mode -1)
; Show line numbers
(global-linum-mode 1)

; Disable warning on opening symlinks to version-controlled files
(setq vc-follow-symlinks t)

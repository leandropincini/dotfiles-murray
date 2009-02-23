(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(current-language-environment "UTF-8")
 '(indent-tabs-mode t)
 '(indicate-buffer-boundaries (quote left))
 '(js2-indent-on-enter-key t)
 '(make-backup-files nil)
 '(py-python-command "ipython")
 '(python-python-command "ipython")
 '(python-use-skeletons t)
 '(show-paren-mode t)
 '(standard-indent 4)
; '(tab-always-indent (quote always))
 '(tab-always-ident t)
 '(tab-width 4)
 '(tooltip-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; Jeremy's groovy mode autoload
(load-library "~/.emacs-files/groovy-mode.el")
(autoload 'groovy-mode "groovy-mode" "Groovy editing mode." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

;; django mode autoload
(load-library "~/.emacs-files/django-mode.el")

;; javascript 2 mode autoload
(load-library "/usr/share/emacs/site-lisp/js2.el")
(autoload 'js2-mode "js2.el" nil t)
(setq auto-mode-alist (append '(("/*.\.js$" .js2-mode)) auto-mode-alist))

;; css mode autoload
(require 'css-mode)
(autoload 'css-mode "css-mode.el" "Mode for editing CSS files" t)
(setq auto-mode-alist (append '(("/*.\.css$" . css-mode)) auto-mode-alist))

;; ruby mode autoload
;;(load-library "~/.emacs-files/ruby")

;; rails mode autoload
;;(load-library "~/.emacs-files/rails")

;; python mode autoload
(require 'python-mode)
(autoload 'python-mode "python-mode.el" "Python mode." t)
(setq auto-mode-alist (append '(("/*.\.py$" . python-mode)) auto-mode-alist))

;; classic theme autoload
(require 'color-theme)
(color-theme-initialize)
;(color-theme-select 'deep-blue)
;(color-theme-classic)

;; wombat-color-theme
;(load-library "~/.emacs-files/emacs-wombat-theme.el")

;; redpill-color-theme
(load-library "~/.emacs-files/emacs-redpill-theme.el")

;; turning on syntax hilighting
(global-font-lock-mode 1)

;; alarmbell off
(setq visible-bell 1)
(setq ring-bell-function 'ignore)

;; autoadd new eof line
(setq require-final-newline t)

;; tab ident
(setq-default indent-tabs-mode t)
(setq tabify t)
(setq c-basic-offset 4)

;; space ident
;(setq-default indent-tabs-mode nil)
;(setq tabify nil)

;; turn off toolbar
(tool-bar-mode -1)
;(menu-bar-mode -1)

;; clear the trash
(setq delete-auto-save-files t)
(setq make-backup-files nil)

;; showing line numbers
(setq line-number-mode t)

;; clear trailing spaces
(global-set-key "\C-cw" 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; truncating of long lines
;(setq truncate-lines nil)
(global-set-key "\C-ct" 'toggle-truncate-lines)

;; speedbar inframe support
(load-library "~/.emacs-files/sr-speedbar.el")
(require 'sr-speedbar)
(global-set-key [(super ?p)] 'sr-speedbar-toggle)

;; speedbar options
(speedbar-add-supported-extension ".js")
(speedbar-add-supported-extension ".css")
(speedbar-add-supported-extension ".djhtml")
(speedbar-add-supported-extension ".groovy")
(speedbar-add-supported-extension ".story")

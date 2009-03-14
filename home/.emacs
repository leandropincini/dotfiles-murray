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
 '(tooltip-mode nil)
 '(ecb-enlarged-compilation-window-max-height (quote best))
 '(ecb-eshell-auto-activate nil)
 '(ecb-layout-name "left8")
 '(ecb-layout-nr 9)
 '(ecb-layout-window-sizes (quote (("left8" (0.21794871794871795 . 0.4878048780487805) (0.21794871794871795 . 0.4878048780487805)) ("left-analyse" (0.21794871794871795 . 0.43902439024390244) (0.21794871794871795 . 0.34146341463414637) (0.21794871794871795 . 0.0975609756097561) (0.21794871794871795 . 0.0975609756097561)))))
 '(ecb-non-semantic-parsing-function nil)
 '(ecb-options-version "2.32")
 '(ecb-other-window-behavior (quote edit-and-compile))
 '(ecb-other-window-jump-behavior (quote edit-and-copmile))
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(ecb-source-path (quote ("~/" "Home")))
 '(ecb-tip-of-the-day nil)
)
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; =====================================
;;  Visual settings
;; =====================================

;; initialize emacs maximized
(defun toogle-fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
						 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
						 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
)
(toogle-fullscreen)

;; classic theme autoload
(require 'color-theme)
(color-theme-initialize)
;(color-theme-classic)

;; wombat-color-theme
;(load-library "~/.emacs-files/emacs-wombat-theme.el")

;; redpill-color-theme
(load-library "~/.emacs-files/emacs-redpill-theme.el")

;; turn off toolbar
(tool-bar-mode -1)
;(menu-bar-mode -1)

;; showing line numbers
(setq line-number-mode t)

;; =====================================
;;  Usability settings
;; =====================================

;; alarmbell off
(setq visible-bell 1)
(setq ring-bell-function 'ignore)

;; turning on syntax hilighting
(global-font-lock-mode 1)

;; autoadd new eof line
(setq require-final-newline t)

;; tab ident
(setq-default indent-tabs-mode t)
(setq tabify t)
(setq c-basic-offset 4)

;; space ident
;(setq-default indent-tabs-mode nil)
;(setq tabify nil)

;; clear the trash
(setq delete-auto-save-files t)
(setq make-backup-files nil)

;; clear trailing spaces
(global-set-key "\C-cw" 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; truncating of long lines
;(setq truncate-lines nil)
(global-set-key "\C-ct" 'toggle-truncate-lines)

;; load cedet
(load-file "/usr/share/emacs/site-lisp/cedet/common/cedet.el")

;; ecb autoload
(add-to-list 'load-path "/usr/share/emacs/site-lisp/ecb")
(setq semantic-load-turn-everything-on t)
(require 'semantic-load)
(require 'ecb)
(require 'ecb-autoloads)
(ecb-activate)
(ecb-redraw-layout)

;; speedbar inframe support
;(load-library "~/.emacs-files/sr-speedbar.el")
;(require 'sr-speedbar)
;(global-set-key [(super ?[)] 'sr-speedbar-toggle)

;; speedbar options
;(speedbar-add-supported-extension ".js")
;(speedbar-add-supported-extension ".css")
;(speedbar-add-supported-extension ".djhtml")
;(speedbar-add-supported-extension ".groovy")
;(speedbar-add-supported-extension ".story")

;; =====================================
;;  Programming settings
;; =====================================

;; javascript 2 mode autoload
(load-library "/usr/share/emacs/site-lisp/js2.el")
(autoload 'js2-mode "js2.el" nil t)
(setq auto-mode-alist (append '(("/*.\.js$" .js2-mode)) auto-mode-alist))

;; css mode autoload
(require 'css-mode)
(autoload 'css-mode "css-mode.el" "Mode for editing CSS files" t)
(setq auto-mode-alist (append '(("/*.\.css$" . css-mode)) auto-mode-alist))

;; python mode autoload
(require 'python-mode)
(autoload 'python-mode "python-mode.el" "Python mode." t)
(setq auto-mode-alist (append '(("/*.\.py$" . python-mode)) auto-mode-alist))

;; django mode autoload
(load-library "~/.emacs-files/django-mode.el")

;; ruby mode autoload
;;(load-library "~/.emacs-files/ruby")

;; rails mode autoload
;;(load-library "~/.emacs-files/rails")

;; Jeremy's groovy mode autoload
(load-library "~/.emacs-files/groovy-mode.el")
(autoload 'groovy-mode "groovy-mode" "Groovy editing mode." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

;; YASnippet autoload
(add-to-list 'load-path "~/.emacs-files/yasnippet-0.5.10")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs-files/yasnippet-0.5.10/snippets")
(setq yas/window-system-popup-function 'yas/x-popup-menu-for-template)

;; Pycomplete autoload
(load-library "~/.emacs-files/pycomplete/pycomplete.el")
;(require 'pycomplete)
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(setq interpreter-mode-alist(cons '("python" . python-mode)
								  interpreter-mode-alist))

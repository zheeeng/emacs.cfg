;the configuration for display

(setq inhibit-startup-screen t)    ;don't show welcome buffer

(fset 'yes-or-no-p 'y-or-n-p)      ;y or n instead of yes or no
(display-time)                     ;display clock
(global-linum-mode t)              ;show line and column number
(setq column-number-mode t)

(setq x-select-enable-clipboard t) ;share clipboard

(setq-default cursor-type 'bar)    ;cursor type as |
(global-hl-line-mode t)            ;highlight the current line

(tool-bar-mode -1)
(menu-bar-mode -1)                 ;disable toolbar,menubar and scrollbar
(scroll-bar-mode -1)

;;======
;;theme
;;=====================================================
(load-theme 'dichromacy t)         ;select the theme
;(load-theme 'adwaita t)
;(load-theme 'deeper-blue)
;(load-theme 'light-blue)
;(load-theme 'manoj-dark)
;(load-theme 'misterioso)
;(load-theme 'tango-dark)
;(load-theme 'tango)
;(load-theme 'tsdh-dark)
;(load-theme 'tsdh-light)
;(load-theme 'wheatgrass)
;(load-theme 'whiteboard)
;(load-theme 'wombat)
;;=====================================================

;;=============
;;tabbar-ruler
;;=====================================================================
(add-to-list 'load-path "~/.emacs.d/plugins/tabbar")
(require 'tabbar)
;(setq tabbar-ruler-global-tabbar 't)
;(setq tabbar-ruler-global-ruler 't)
;(require 'tabbar-ruler)
(tabbar-mode t)
(global-set-key [C-tab] 'tabbar-forward)             ;switch tabbar
(global-set-key [C-S-iso-lefttab] 'tabbar-backward)
;;=====================================================================

;encoding
(load-file "~/.emacs.d/plugins/unicad.el")
(require 'unicad)

;all *~ files in one place
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))     

(set-default-font "-unknown-文泉驿等宽微米黑-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1")

;;============
;;transparent
;;=====================================================================
(defun toggle-transparent()
  "transparent frame or not"
  (interactive)
  (if (or
	   (equal (frame-parameter (selected-frame) 'alpha) nil)
	   (equal (frame-parameter (selected-frame) 'alpha) '(100 100)))
	  (set-frame-parameter (selected-frame) 'alpha '(70 50))
	(set-frame-parameter (selected-frame) 'alpha '(100 100))))
(global-set-key [(f11)] 'toggle-transparent)
;;=====================================================================

;;=========
;;user info
;;=====================
(setq user-full-name "yuanhang zheng"
	  user-mail-address "zhengyhn@gmail.com")
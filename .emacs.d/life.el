;;; life.el --- configuration file for beautiful life
;;
;; Copyright (c) 2013 yuanhang zheng
;;
;; Author: yuanhang zheng <zhengyhn@gmail.com>
;;

;;; code

;;for goagent
;(setq url-proxy-services '(("http" . "127.0.0.1:8087")))

;;org-mode
(add-to-list 'load-path (concat plugins-path "org-mode/lisp"))
(add-to-list 'load-path (concat plugins-path "org-mode/contrib/lisp") t)
(eval-after-load "org-mode"
  '(progn
	; key bindings
	 (global-set-key (kbd "S-TAB") 'pcomplete)
	; todo list
	 (setq org-todo-keywords
		   '((sequence "TODO(t)" "DOING(i!)" "DONE(d!)")))
	; code language
	 (org-babel-do-load-languages
	  'org-babel-load-languages
	  '((C . t)
		(java . t)
		(sh . t)
		(js . t)
		(sql . t)
		(haskell . t)
		(python . t)))
	 (setq org-export-default-language "zh-CN")
	 (add-hook 'org-mode-hook
			   (lambda ()
				 (setq truncate-liness nil)))))

;;weibo
(add-to-list 'load-path (concat plugins-path "weibo"))
(autoload 'weibo-timeline "weibo")
(global-set-key (kbd "C-c w") 'weibo-timeline)

;;jabber-mode
(add-to-list 'load-path (concat plugins-path "emacs-jabber-0.8.91"))
(require 'jabber-autoloads)
(global-set-key (kbd "C-c j c") 'jabber-connect-all)
(eval-after-load "jabber-autoloads"
  '(progn
	 (setq jabber-account-list
		   '(("zhengyhn@gmail.com"
			  (:password . " mvfcbuvemzqlcead ")
			  (:network-server . "talk.google.com")
			  (:connection-type . ssl))))
	 (global-set-key
	  (kbd "C-c j v") '(lambda ()
						 "visit jabber roster"
						 (interactive)
						 (jabber-display-roster)
						 (switch-to-buffer "*-jabber-roster-*")))))

;;stardict
;(load-file (concat plugins-path "sdcv-mode.el"))
(autoload 'sdcv-search "sdcv-mode")
(global-set-key (kbd "C-c d") 'sdcv-search)

;;emms
(add-to-list 'load-path (concat plugins-path "emms-3.0"))
(global-set-key (kbd "C-c e g") 'emms-play-directory)    ;go
(autoload 'emms-play-directory "emms-setup")
(autoload 'emms-play-directory "emms-player-mplayer")
(eval-after-load "emms-setup"
  '(progn
	 (setq exec-path (append exec-path '("/usr/bin")))
	 (emms-standard)
	 (emms-default-players)
	 (setq emms-player-list '(emms-player-mplayer)
		   emms-player-mplayer-command-name "mplayer"
		   emms-player-mplayer-parameters '("-slave"))
	 (setq emms-repeat-playlist t
		   emms-source-file-default-directory "~/movie/music"
		   emms-lyrics-dir "~/movie/music"
		   emms-lyrics-coding-system nil
		   emms-playlist-buffer-name "*EMMS*")
	 (global-set-key (kbd "C-c e v") 'emms-playlist-mode-go)  ;visit
	 (global-set-key (kbd "C-c e s") 'emms-stop)
	 (global-set-key (kbd "C-c e n") 'emms-next)
	 (global-set-key (kbd "C-c e p") 'emms-previous)
	 (global-set-key (kbd "C-c e r") 'emms-shuffle)           ;random
	 (global-set-key (kbd "C-c e SPC") 'emms-pause)
	 (global-set-key (kbd "C-c e d") 'emms-play-dired)
	 (global-set-key (kbd "C-c e x") 'emms-start)))

;;google
(defun google ()
  "google a query or a region"
  (interactive)
  (browse-url
   (concat
	"http://www.google.com/search?ie=utf-8&oe=utf-8&q="
	(url-hexify-string (if mark-active
						   (buffer-substring (region-beginning) (region-end))
						 (read-string "google: "))))))
(global-set-key (kbd "C-c g") 'google)

(add-to-list 'load-path (concat plugins-path "youdao-dict"))
(autoload 'youdao-dict-query "youdao-dict")

;;; life.el ends here


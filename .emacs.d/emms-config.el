;;emms

(add-to-list 'load-path (concat plugins-path "emms-3.0"))
(setq exec-path (append exec-path '("/usr/bin")))
(require 'emms-setup)
(require 'emms-player-mplayer)
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
(global-set-key (kbd "C-c e g") 'emms-play-directory)    ;go
(global-set-key (kbd "C-c e v") 'emms-playlist-mode-go)  ;visit
(global-set-key (kbd "C-c e s") 'emms-stop)
(global-set-key (kbd "C-c e n") 'emms-next)
(global-set-key (kbd "C-c e p") 'emms-previous)
(global-set-key (kbd "C-c e r") 'emms-shuffle)           ;random
(global-set-key (kbd "C-c e SPC") 'emms-pause)
;(global-set-key (kbd "C-c e d") 'emms-play-dired)
;(global-set-key (kbd "C-c e x") 'emms-start)

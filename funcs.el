;; baileys/funcs.el
;; baileys auxilary funcs

(defun baileys/dark ()
  "Let's go dark!"
  (interactive)
  (message "baileys: loading dark theme")
  (set-terminal-parameter nil 'background-mode 'dark)
  (set-frame-parameter nil 'background-mode 'dark)
  ; (spacemacs/load-theme 'solarized t)
  (spacemacs/load-theme 'spacemacs-dark t)

  )

(defun baileys/light ()
  "Let's go light!"
  (interactive)
  (message "baileys: loading light theme")
  (set-terminal-parameter nil 'background-mode 'light)
  (set-frame-parameter nil 'background-mode 'light)

  ;; (spacemacs/load-theme 'solarized t)
  ;; (spacemacs/load-theme 'sanityinc-solarized-light t)
  (spacemacs/load-theme 'spacemacs-light t)
  )

(defun read-colour ()
  (with-temp-buffer
    (insert-file-contents-literally "~/.colour-theme")
    (decode-coding-region (point-min) (point-max) 'utf-8 t)))

(defun baileys/auto-colour ()
  "Automatically load the appropiate colour scheme based
   on your horoscope, geophysical conditions, and day/night cycles."
  (interactive)
  (baileys/light)

  (message (read-colour))
  ;; (setq (colour-file "~/.colour-theme"))




  ;; (message (concat "baileys: loading theme file: " colour-file))

  )

;; Master initialisation functor
(defun baileys/init ()
  (baileys/auto-colour)
  (message "baileys: initialised"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Kick things off!
(baileys/init)

;; baileys/funcs.el
;; baileys auxilary funcs

(defun baileys/dark ()
  "Let's go dark!"
  (interactive)
  (set-terminal-parameter nil 'background-mode 'dark)
  (set-frame-parameter nil 'background-mode 'dark)
  (spacemacs/load-theme 'solarized t)
  (message "baileys: dark mode activated!"))

(defun baileys/light ()
  "Let's go light!"
  (interactive)
  (set-terminal-parameter nil 'background-mode 'light)
  (set-frame-parameter nil 'background-mode 'light)
  (spacemacs/load-theme 'solarized t)
  (message "baileys: light mode activated!"))

(defun read-colour ()
  (with-temp-buffer
    (insert-file-contents-literally "~/.colour-theme")
    (decode-coding-region (point-min) (point-max) 'utf-8 t)))

(defun baileys/transparent ()
  "Set the window state to transparent along with various face/bg updates"
  (interactive)
  (set-face-background 'default "unspecified-bg" (selected-frame))

  (custom-set-faces '(hl-line ((t (:background nil)))))
  (set-face-attribute 'fringe nil :background nil)
  (set-face-attribute 'linum nil :background nil)

  (message "baileys: transparent mode activated!"))

(defun baileys/auto-colour ()
  "Automatically load the appropiate colour scheme based
   on your horoscope, geophysical conditions, and day/night cycles."
  (interactive)
  (baileys/dark)

  (message (read-colour))
  ;; (setq (colour-file "~/.colour-theme"))


  ;; (message (concat "baileys: loading theme file: " colour-file))

  )

;; Master initialisation functor

(defun baileys/init ()
  (baileys/auto-colour)
  (message "baileys: initialised"))

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
  ;; (if (string= "light\n" (read-colour)) (baileys/light) (baileys/dark))
  (message (concat "baileys: detected colour " (read-colour))))

(defun baileys/clang-format-buffer-smart ()
  "Reformat buffer if .clang-format exists in the projectile root."
  (when (f-exists? (expand-file-name ".clang-format" (projectile-project-root)))
    (clang-format-buffer)))

(defun baileys/open-related ()
  "Open related include header"
  (interactive)
  (message "baileys: opening related file")
  (ggtags-find-tag-dwim))


(defun baileys/clang-format-buffer-smart-on-save ()
  "Add auto-save hook for clang-format-buffer-smart."
  (add-hook 'before-save-hook 'baileys/clang-format-buffer-smart nil t))

(spacemacs/add-to-hooks 'baileys/clang-format-buffer-smart-on-save
                        '(c-mode-hook c++-mode-hook))

;; Master initialisation functor

(defun baileys/init ()
  (baileys/auto-colour)
  (message "baileys: initialised"))

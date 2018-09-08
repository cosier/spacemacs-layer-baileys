;; baileys/funcs.el
;; baileys auxilary funcs

(defun baileys/toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
               (if (= (car this-win-edges)
                      (car (window-edges (next-window))))
                   'split-window-horizontally
                   'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))

; (global-set-key (kbd "C-x |") 'toggle-window-split)

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
  (if (string= "light\n" (read-colour)) (baileys/light) (baileys/dark))
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

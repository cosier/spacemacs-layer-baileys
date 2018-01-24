;; baileys/config.el
;; baileys configuration

(setq make-backup-files nil)
(setq vc-follow-symlinks t)
(setq vc-suppress-confirm t)

(global-linum-mode t)
(setq-local global-hl-line-mode 0)
(setq-default smartparens-strict-mode nil)

(setq-default helm-make-build-dir "build")
(setq-default make-backup-files nil)

(defun baileys-indent (n)
  ;; java/c/c++
  (setq-local standard-indent n)
  (setq c-default-style "linux"
        c-basic-offset n)
  ;; web development
  (setq-local javascript-indent-level n) ; javascript-mode
  (setq-local js-indent-level n) ; js-mode
  (setq-local react-indent-level n) ; react-mode
  (setq-local js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq-local web-mode-attr-indent-offset n) ; web-mode
  (setq-local web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq-local web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq-local web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq-local web-mode-sql-indent-offset n) ; web-mode
  (setq-local web-mode-attr-value-indent-offset n) ; web-mode
  (setq-local web-mode-markup-indent-offset n) ; web-mode
  (setq-local css-indent-offset n) ; css-mode
  (setq-local sh-basic-offset n) ; shell scripts
  (setq-local sh-indentation n))

(defun baileys-c-mode-common-hook ()
  (message "bailey-c-mode-common-hook: go!")
  (baileys-code-style))

(defun baileys-code-style ()
  (interactive)
  (setq indent-tabs-mode nil)
  (baileys-indent 2))

(add-hook 'css-mode-hook 'baileys-code-style)
(add-hook 'js2-mode-hook 'baileys-code-style)
(add-hook 'react-mode-hook 'baileys-code-style)
(add-hook 'sh-mode-hook 'baileys-code-style)

(add-hook 'c-mode-hook (lambda () (setq comment-start "//"
                                        comment-end   "")))

(add-hook 'c-mode-common-hook 'baileys-c-mode-common-hook)

; (add-hook 'c++-mode-hook
          ; (lambda () (setq flycheck-clang-include-path
                           ; (list (expand-file-name "~/Developer/work/midi-mapper/src/")))))


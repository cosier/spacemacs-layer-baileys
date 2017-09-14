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


(defun baileys-c-mode-common-hook ()
  (message "bailey-c-mode-common-hook: go!")
  (setq c-default-style "linux"
        c-basic-offset 4)
  
(defun my-c-mode-common-hook ()
  (setq flycheck-clang-include-path (list "..")))

(add-hook 'c-mode-hook (lambda () (setq comment-start "//"
                                        comment-end   "")))

(add-hook 'c-mode-common-hook 'baileys-c-mode-common-hook)

(add-hook 'c++-mode-hook
          (lambda () (setq flycheck-clang-include-path
                           (list (expand-file-name "~/Developer/work/midi-mapper/src/")))))


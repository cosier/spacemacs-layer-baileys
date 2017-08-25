;; baileys/config.el
;; baileys configuration

(setq vc-follow-symlinks t)
(setq vc-suppress-confirm t)

(setq-local global-hl-line-mode 0)
(global-linum-mode t)

(setq-default helm-make-build-dir "build")
(setq-default make-backup-files nil)

(defun my-c-mode-common-hook ()
  (setq flycheck-clang-include-path (list "..")))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(add-hook 'c++-mode-hook
          (lambda () (setq flycheck-clang-include-path
                           (list (expand-file-name "~/Developer/work/midi-mapper/src/")))))

(message "baileys: config.el loaded!")



(global-subword-mode 1)
(global-set-key (kbd "C-M-x") 'align-regexp)
(global-set-key (kbd "C-c d") 'delete-trailing-whitespace)
(global-set-key (kbd "C-x O") 'previous-multiframe-window)
(global-unset-key "\C-z")

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

(global-hl-line-mode 1)
(set-default-font "Monospace-8")

(tool-bar-mode -1)
(menu-bar-mode -1)

(defun java-fix-indent ()
  (c-set-offset 'arglist-intro '+))
(add-hook 'java-mode-hook 'java-fix-indent)

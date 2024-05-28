;; Path to nano emacs modules (mandatory)

(add-to-list 'load-path "/home/iluvshiwoon/.emacs.d/nano-emacs")

;; load nano theme
(require 'nano)

(setq custom-safe-themes t)
(setq use-package-always-ensure t)

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

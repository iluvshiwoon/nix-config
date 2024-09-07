(setq use-package-always-ensure t)
(setq inhibit-startup-message t) ; Don't show the splash screen
(setq visible-bell t)            ; Flash when the bell rings

;; Turn off some unneeded UI elements
;; (menu-bar-mode -1)  ; Leave this one on if you're a beginner!
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Enable auto pair
(electric-pair-mode 1)

;; Display line numbers in every buffer
(global-display-line-numbers-mode 1)

;; Say y or n instead of yes or no
(defalias 'yes-or-no-p 'y-or-n-p)

;; Restore default tab functionality in org-mode
(setq evil-want-C-i-jump nil)

;; Restore default C-u functionality with Evil
(setq evil-want-C-u-scroll t)

;; Initialize Evil mode and friends
(use-package evil
:init
(setq evil-vsplit-window-right t)
:config
(evil-mode 1)

(use-package evil-leader
:ensure t
:config
(global-evil-leader-mode))

(use-package evil-surround
:config
(global-evil-surround-mode 1))

(use-package evil-org
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package evil-indent-plus
  :config
  (evil-indent-plus-default-bindings))

(use-package evil-commentary
:config
(evil-commentary-mode)))

(use-package evil-terminal-cursor-changer
:init
(setq evil-motion-state-cursor 'box)  ; █
(setq evil-visual-state-cursor 'box)  ; █
(setq evil-normal-state-cursor 'box)  ; █
(setq evil-insert-state-cursor 'bar)  ; ⎸
(setq evil-emacs-state-cursor  'hbar) ; _
:config
(evil-terminal-cursor-changer-activate))

;; Swap 0 and ^, i.e. make 0 move the cursor back to the first non-whitespace character
(define-key evil-motion-state-map (kbd "0") 'evil-first-non-blank)
(define-key evil-motion-state-map (kbd "^") 'evil-beginning-of-line)

(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "f" 'helm-projectile-find-file
  "F" 'helm-projectile-ag
  "q" 'evil-quit
  "w" 'save-buffer
  "t" 'neotree-toggle
  "e" 'emojify-insert-emoji
  "g" 'magit)

(evil-leader/set-key-for-mode 'org-mode
  "A" 'org-archive-subtree
  "a" 'org-agenda
  "c" 'org-capture
  "d" 'org-deadline
  "l" 'evil-org-open-links
  "s" 'org-schedule
  "t" 'org-todo)

(setq org-startup-indented t
      org-ellipsis "  "
      org-hide-leading-stars t
      org-src-fontify-natively t
      org-src-tab-acts-natively t
      org-pretty-entities t
      org-hide-emphasis-markers t
      org-agenda-block-separator ""
      org-fontify-whole-heading-line t
      org-fontify-done-headline t
      org-fontify-quote-and-verse-blocks t)

(use-package org
:ensure org-plus-contrib)

(use-package org-bullets
:config
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(setq org-agenda-window-setup 'only-window)

;; Setting the foreground color to nil causes the ellipsis to take the color of its heading.
(custom-set-faces
 '(org-ellipsis ((t (:foreground nil)))))

(use-package nano-theme
  :init
  (setq nano-light-background "#fafafa"
        nano-light-highlight "#f5f7f8"))

(package-initialize)
(load-theme 'nano-dark t)



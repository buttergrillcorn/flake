;;; This dotfile is managed using dotdrop
;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "James"
      user-mail-address "jamesyuli@outlook.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:

;; (setq doom-font (font-spec :family "Sarasa Term SC Nerd" :size 15 :weight 'Semibold)
;;       doom-variable-pitch-font (font-spec :family "Sarasa Term SC Nerd" :size 15)
;;       doom-unicode-font (font-spec :family "Symbols Nerd Font Mono" :size 16))

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tomorrow-night)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Org Capture
(after! org
  (setq org-capture-templates
        `(("t" "Todo" entry (file "~/org/todo.org")
           "* TODO %U %?" :empty-lines-after 1)
          ("i" "Inbox" entry (file "~/org/inbox.org")
           "* %t %?" :empty-lines-after 1)
          ("w" "Work" entry (file "~/org/work.org")
           "* %t %?  %(org-set-tags \"work\")" :empty-lines-after 1)
          ("j" "Journal" entry (file+datetree "~/org/journal.org")
           "* %?" :jump-to-captured t :time-prompt t)
          )))

;; Org Babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (emacs-lisp . t)
   (python . t)
   (conf-toml . t)
   (rust . t)
   ))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Load external files
(load! "font.el")

;; Keybinds
(map! "C-h" 'switch-to-prev-buffer)
(map! "C-l" 'switch-to-next-buffer)
(map! "C-S-l" 'recenter-top-bottom)

;; Which-key
;; (setq which-key-idle-delay 0.2)
(setq auto-save-visited-interval 15)
(auto-save-visited-mode +1)

;; Org auto list
(add-hook 'org-mode-hook
          (lambda () (org-autolist-mode)))

;; Projects
(projectile-add-known-project "~/org")
(projectile-add-known-project "~/dot")

;; Shell
(setq shell-file-name (executable-find "bash"))
(setq-default vterm-shell (executable-find "fish"))
(setq-default explicit-shell-file-name (executable-find "fish"))

;; dimmer
(use-package! dimmer
  :init
  (dimmer-mode)
  (setq dimmer-fraction 0.3)
  (dimmer-configure-which-key)
  (dimmer-configure-magit))

;; Zoom
;; (use-package! zoom
;;   :init
;;   (zoom-mode t))
;; (custom-set-variables
;;  '(zoom-ignored-major-modes '(which-key-mode)))

;; Beacon
(use-package! beacon
  :init
  (beacon-mode t))

;; Golden Ratio
;; (use-package! golden-ratio
;;   :init
;;   (golden-ratio-mode 1)
;;   (setq golden-ratio-auto-scale 1))

;; Org Modern
(after! org
  (global-org-modern-mode))

;; Org Super Agenda
(after! org
  (setq org-super-agenda-mode t))

;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

(setq user-full-name "Yu Li (James)"
      user-mail-address "jamesyuli@outlook.com")

(setq doom-font (font-spec :family "Iosevka Nerd Font" :size 16 :weight 'Regular)
      doom-variable-pitch-font (font-spec :family "Noto Sans CJK SC" :size 16)
      doom-serif-font (font-spec :family "Noto Serif CJK SC" :size 16)
      doom-symbol-font (font-spec :family "Symbols Nerd Font Mono" :size 16)
      doom-unicode-font (font-spec :family "Symbols Nerd Font Mono" :size 16))

(setq doom-theme 'doom-one)

(setq display-line-numbers-type 'relative)

;; (setq which-key-idle-delay 0.2)
(setq auto-save-visited-interval 15)
(auto-save-visited-mode +1)

(map! :after which-key
      :map which-key-mode-map
      "C-n" #'which-key-show-next-page-no-cycle
      "C-n" #'which-key-show-next-page-no-cycle)

;; --- Snipping ---
(after! evil-snipe
  (setq evil-snipe-scope 'visible
        evil-snipe-smart-case 1)
  (evil-define-key '(normal motion) evil-snipe-local-mode-map
    "s" 'evil-avy-goto-char-timer))

;; --- Org mode ---
(setq org-directory "~/notes/")

(after! org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (elisp . t)
     (emacs-lisp . t)
     (lua . t)
     (makefile . t)
     (js . t)
     (css . t)
     (shell . t)
     (python . t)
     (rust . t))))

;; (after! org
;;   (setq org-hide-emphasis-markers t)
;;   (setq org-pretty-entities t))

(setq org-pomodoro-length 30)

(after! org
  (setq org-agenda-files '("~/notes/")))

(add-hook! org-mode-hook #'org-autolist-mode)

(add-hook! org-mode-hook #'org-auto-tangle-mode)

(setq org-auto-tangle-babel-safelist '(
                                       "~/example.org"
                                       "~/example2.org"))


(use-package org-mem
  :defer
  :config
  (setq org-mem-watch-dirs
        (list "~/notes"))
  (org-mem-updater-mode))

(use-package org-node
  :config
  (org-node-cache-mode)
  (org-node-complete-at-point-mode)

  ;; Backlinks drawer
  (setq org-node-backlink-do-drawers t)
  (org-node-backlink-mode)

  ;; Time_Modified Property
  (setq org-node-property-mtime "TIME_MODIFIED")
  (add-hook 'org-node-modification-hook
            #'org-node-update-mtime-property)
  ;; Lining up Properties
  (add-hook 'org-node-modification-hook
            (defun my-sort-properties ()
              (org-back-to-heading-or-point-min)
              (re-search-forward org-property-drawer-re (org-entry-end-position))
              (let ((end (pos-bol))
                    (beg (progn (goto-char (match-beginning 0))
                                (forward-line 1)
                                (point))))
                (sort-lines nil beg end)))
            50)
  ;; The above is so the following properties will come in predictable order.
  (setq org-node-property-crtime "TIME_CREATED")
  (setq org-node-property-mtime "TIME_MODIFIED")

  ;; Backlinks buffer
  (org-node-context-follow-mode)

  ;; Duplicate Titles
  (setq org-node-alter-candidates t)

  ;; Sort completion
  (setq org-node-display-sort-fn
        #'org-node-sort-by-mtime-property))

(map! :leader
      (:prefix ("r" . "Roam")
       :desc "Find Node" "f" #'org-node-find
       :desc "Insert Node" "i" #'org-node-insert-link
       :desc "Backlinks" "b" #'org-node-context-dwim
       :desc "Search" "s" #'org-node-grep
       :desc "Refile" "r" #'org-node-refile
       :desc "Random" "R" #'org-node-visit-random
       :desc "Set Tags" "t" #'org-node-set-tags
       :desc "Add Alias" "a" #'org-node-add-alias
       :desc "Add Refs" "A" #'org-node-add-refs
       :desc "Convert" "c" #'org-node-nodeify-entry
       (:prefix ("o" . "Operations")
        :desc "Rewrite Link" "l" #'org-node-rewrite-links-ask
        :desc "Rename by Title" "t" #'org-node-rename-file-by-title
        :desc "Dead Links" "d" #'org-node-list-dead-links
        :desc "Lint All Files" "L" #'org-node-lint-all-files
        :desc "List Reflinks" "r" #'org-node-list-reflinks)))

(map! :leader :desc "Diff Highlights" "t D" #'diff-hl-mode)
(map! :leader :desc "Doc Mode" "t d" #'doom-docs-mode)

;; (projectile-add-known-project "~/org")
(projectile-add-known-project "~/flake")
(projectile-add-known-project "~/doom")
(projectile-add-known-project "~/notes")

(use-package! claude-code
  :after inheritenv
  :config
  (setq claude-code-terminal-backend 'vterm)
  (claude-code-mode)
  :bind
  (:repeat-map my-claude-code-map ("M" . claude-code-cycle-mode)))

(map! :leader :desc "Claude Code" "e" #'claude-code-transient)
;; (:prefix-map ("e" . "Claude")
;;  :desc "Start" "e" #'claude-code-transient))

(use-package! pulsar
  :init
  (pulsar-global-mode 1)
  :config
  (setq pulsar-delay 0.1
        pulsar-iterations 20
        pulsar-face 'pulsar-yellow
        pulsar-region-face 'pulsar-cyan
        pulsar-highlight-face 'pulsar-magenta)
  :hook
  ((next-error-hook . pulsar-pulse-line)
   (minibuffer-setup-hook . pulsar-pulse-line-blue)
   (consult-after-jump-hook . pulsar-recenter-top)
   (consult-after-jump-hook . pulsar-reveal-entry)))

;; --- Grease ---
(use-package! grease
  :commands (grease-open grease-toggle grease-here)
  :init
  (setq grease-sort-method 'type
        grease-show-hidden t
        grease-preview-window-width 0.4
        grease-preview-writable t))
;; FIX for Grease
(with-eval-after-load 'grease
  (defun grease--project-root ()
    "Return the root directory of the current project, or `default-directory`."
    (or
     ;; Try built-in project.el (but fail gracefully if no project found)
     (and (fboundp 'project-current)
          (when-let ((proj (project-current nil)))
            (car (project-roots proj))))
     ;; Try Projectile
     (and (fboundp 'projectile-project-root)
          (ignore-errors (projectile-project-root)))
     ;; Fallback to current folder (Fixes the crash!)
     default-directory)))
;; Grease Key Binds
(map! :leader
      (:prefix ("o g" . "Grease")
       :desc "Toggle Grease"           "g" #'grease-toggle
       :desc "Open Grease (current)"   "o" #'grease-open
       :desc "Open at project root"    "h" #'grease-here))

;; --- KDL Format ---
(use-package! kdl-mode
  :mode "\\.kdl\\'"
  :config
  (setq kdl-selection-method 'tree-sitter))

(after! org
  (add-to-list 'org-src-lang-modes '("kdl" . kdl)))

;; --- Smooth Scrolling ---
(use-package! ultra-scroll
  :init
  (setq scroll-conservatively 3
        scroll-margin 0)
  :config
  (ultra-scroll-mode 1))

;; --- GPTel ---
(load! "~/.config/doom-secrets.el")

(use-package! gptel
  :config
  (setq! gptel-api-key my-gpt-api-key)
  (gptel-make-gemini "Gemini" :key my-gemini-api-key :stream t)
  (gptel-make-openai "OpenRouter"
    :host "openrouter.ai"
    :endpoint "/api/v1/chat/completions"
    :stream t
    :key my-openrouter-api-key
    :models '(arcee-ai/trinity-large-preview:free
              tngtech/deepseek-r1t2-chimera:free
              qwen/qwen3-coder:free
              stepfun/step-3.5-flash:free
              openrouter/aurora-alpha))
  (gptel-make-deepseek "DeepSeek"
    :stream t
    :key my-deepseek-api-key))

;; --- Spelling Dictionary Fix (For Nix) ---
(setq ispell-personal-dictionary "~/ispell/en.pws")
(after! ispell
  (setq ispell-program-name "aspell"
        ispell-aspell-dict-dir (executable-find "aspell")
        ispell-dictionary "en_GB"
        ispell-personal-dictionary "~/ispell/en.pws"
        ispell-extra-args '("--encoding=utf-8")))

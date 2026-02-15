;; no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  DO NOT EDIT DIRECTLY, THIS FILE IS AUTO-GENERATED WITH ORG-BABEL-TANGLE!  ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.

;; Orgmode
(package! org-autolist)
;; (package! org-appear)
(package! org-auto-tangle)

;; Claude Code
(package! inheritenv)
(package! claude-code)

;; Pulsar
(package! pulsar)

;; Grease
(package! grease
  :recipe (:host github :repo "mwac-dev/grease.el")
	:pin "5f1862af159f178f482f36ccccd54e66cad16028")

;; KDL language
(package! kdl-mode)

;; Ultra Scroll
(package! ultra-scroll)

(package! org-mem)
(package! org-node)

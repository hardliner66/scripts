;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "hardliner66"
  user-mail-address "hardliner66@gmail.com")

(defun signal-restart-server ()
  "Handler for SIGUSR1 signal, to (re)start an emacs server.

  Can be tested from within emacs with:
    (signal-process (emacs-pid) 'sigusr1)

  or from the command line with:
  $ kill -USR1 <emacs-pid>
  $ emacsclient -c
  "
    (interactive)
    (server-force-delete)
    (server-start))

(define-key special-event-map [sigusr1] 'signal-restart-server)

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

(setq doom-font (font-spec :family "Fira Code" :size 14 :weight 'semi-light))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

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

(setq org-clock-persist 'clock)
(org-clock-persistence-insinuate)

(map! :leader :nv "w" nil)
(map! :leader :nv "w" #'save-buffer)
(map! :leader :nv "j" #'previous-buffer)
(map! :leader :nv "k" #'next-buffer)
(map! :leader :nv "d" #'kill-this-buffer)
(map! :leader :nv "bj" #'buffer-menu)

(use-package! org-roam
  ;; :ensure t
  ;; :hook
  ;; (after-init . org-roam-mode)
  :custom
  (org-roam-directory "~/.org-roam")
  (org-roam-index-file "~/.org-roam/index.org"))

(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
  :after org-roam
  :commands org-roam-ui-open
  :hook (org-roam . org-roam-ui-mode)
  :config
  (require 'org-roam) ; in case autoloaded
  (setq org-roam-ui-sync-theme t
    org-roam-ui-follow t
    org-roam-ui-update-on-save t
    org-roam-ui-open-on-start t)
  (defun org-roam-ui-open ()
    "Ensure the server is active, then open the roam graph."
    (interactive)
    (unless org-roam-ui-mode (org-roam-ui-mode 1))
    (browse-url-xdg-open (format "http://localhost:%d" org-roam-ui-port))))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/.org/")

(after! org-auto-tangle (add-hook 'org-mode-hook 'org-auto-tangle-mode))

(after! ccls
  (setq ccls-initialization-options `(:cache (:directory ,(expand-file-name "~/.ccls-cache")))))

(setq work-dir "~/.work-config")
(setq work-config (concat work-dir "/emacs/config.el"))
(if (file-exists-p work-config) (load work-config))

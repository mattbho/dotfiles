;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

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
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)
(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 16))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/org/")
(setq lsp-file-watch-threshold 5000)


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

(add-hook 'window-setup-hook #'toggle-frame-maximized)
(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)

(use-package! magit-delta
  :hook (magit-mode . magit-delta-mode))

;; GPT Integration
(use-package! gptel
  :config
  (setq gptel-api-key "")
  (setq gptel-default-mode 'org-mode)
  )

(use-package! codeium
  :after corfu
  :config
  (setq codeium/metadata/functions `(corfu))
  (add-hook 'js-mode-hook
            (lambda ()
              (add-to-list 'completion-at-point-functions #'codeium-completion-at-point)))
  ;; Add hook for rsjx-mode
  (add-hook 'rsjx-mode-hook
            (lambda ()
              (add-to-list 'completion-at-point-functions #'codeium-completion-at-point))))



(after! org
  (setq org-capture-templates
        '(("i" "Inbox" entry
           (file+headline "~/Documents/org/gtd/inbox.org" "Inbox")  ; Specify Inbox file and header
           "* TODO %?\n  TIMESTAMP: %t"  ; Capture template with timestamp
           :empty-lines 1)
          ("p" "Todo with project tag" entry
           (file+headline "~/Documents/org/gtd/main.org" "Projects")  ; Update to main.org
           "* PROJ %? :PROJECT:\n"  ; Template format with a project tag
           :empty-lines 1)))

  (setq org-todo-keywords
        '((sequence "TODO(t)" "WAIT(w)" "PROJ(p)" "|" "DONE(d)" "CANC(c)")))

  (setq org-agenda-files '("~/Documents/org/gtd/main.org"  ; Consolidated main.org
                           "~/Documents/org/gtd/inbox.org"
                           ))  ; Added inbox.org
  (setq org-refile-targets
        '((nil :maxlevel . 3)  ; Allow refiling to any heading in the current file
          ("~/Documents/org/gtd/main.org" :maxlevel . 3)  ; Allow refiling to main.org
          ("~/Documents/org/gtd/inbox.org" :maxlevel . 3)))  ; Allow refiling to inbox.org

  (setq org-agenda-custom-commands
        '(("g" "GTD view"
           ((agenda "" ((org-agenda-overriding-header "Today")
                        (org-agenda-span 'day)  ; Only show the current day
                        (org-agenda-start-day (format-time-string "%Y-%m-%d"))))
            (todo "TODO" ((org-agenda-overriding-header "Inbox")
                          (org-agenda-files '("~/Documents/org/gtd/inbox.org"))))
            (todo "TODO" ((org-agenda-overriding-header "Next Actions")
                          (org-agenda-files '("~/Documents/org/gtd/main.org"))))
            (todo "PROJ" ((org-agenda-overriding-header "Projects")))
            ;; Combined section for WAIT, DONE, and PROJ
            (todo "WAIT" ((org-agenda-overriding-header "Wait")))
            (todo "DONE" ((org-agenda-overriding-header "Completed")))
            )))))


(after! org-roam
  (setq org-roam-capture-templates
        '(("i" "Index" plain
           "%?"
           :if-new (file+head "%<%Y-%m-%d_%H%M%S>-${slug}.org"
                              "#+TITLE: ${title}\n#+FILETAGS: index\n")
           :unnarrowed t)
          ("n" "Note" plain
           "* ${title}\n\n* Tags:\n  :ROAM:\n\n* References:\n%?"
           :if-new (file+head "%<%Y-%m-%d_%H%M%S>-${slug}.org"
                              "#+TITLE: ${title}\n")  ; No file tags
           :unnarrowed t))))

(use-package! websocket
  :after org-roam)

(use-package! org-roam-ui
  :after org-roam ;; or :after org
  ;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
  ;;         a hookable mode anymore, you're advised to pick something yourself
  ;;         if you don't care about startup time, use
  :hook (after-init . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

(defun cust/vsplit-file-open (f)
  (let ((evil-vsplit-window-right t))
    (+evil/window-vsplit-and-follow)
    (find-file f)))

(defun cust/split-file-open (f)
  (let ((evil-split-window-below t))
    (+evil/window-split-and-follow)
    (find-file f)))

(map! :after embark
      :map embark-file-map
      "V" #'cust/vsplit-file-open
      "X" #'cust/split-file-open)

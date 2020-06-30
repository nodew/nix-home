;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()

   dotspacemacs-configuration-layers
   '(
     better-defaults

     ;; Document
     org
     markdown

     ;; Version control
     git

     ;; checker
     spell-checking
     syntax-checking

     lsp

     ;; Languages
     emacs-lisp
     common-lisp
     (haskell :variables
              haskell-enable-hindent nil
              haskell-completion-backend 'lsp
              haskell-process-type 'cabal-repl
      )
     rust
     racket
     javascript

     nixos)

   dotspacemacs-additional-packages
   '(direnv
     lsp-ui
     lsp-haskell)

   dotspacemacs-frozen-packages '()

   dotspacemacs-excluded-packages '()

   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   dotspacemacs-default-font '("Monaco"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.3)

   dotspacemacs-leader-key "SPC"

   dotspacemacs-emacs-command-key "M-x"

   dotspacemacs-ex-command-key ":"
   ))

(defun dotspacemacs/user-init ()
  (setq exec-path-from-shell-arguments '("-i"))
  (setq configuration-layer--elpa-archives
    '(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
      ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
      ("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/"))))

(defun dotspacemacs/user-config ()
  (direnv-mode)

  (add-hook 
    'haskell-mode-hook 
    (lambda ()
      (direnv-update-environment)
      (require 'lsp-haskell)
      (setq lsp-haskell-process-path-hie "haskell-language-server-wrapper")
      (lsp)
      (evil-leader/set-key-for-mode 'haskell-mode "gm" 'lsp-ui-imenu)
      (evil-leader/set-key-for-mode 'haskell-mode "gg" 'lsp-ui-peek-find-definitions)
      (evil-leader/set-key-for-mode 'haskell-mode "gr" 'lsp-ui-peek-find-references)
      (evil-leader/set-key-for-mode 'haskell-mode "en" 'flycheck-next-error)
      (evil-leader/set-key-for-mode 'haskell-mode "ep" 'flycheck-previous-error)
      (evil-leader/set-key-for-mode 'haskell-mode "el" 'flycheck-list-errors)
      (evil-leader/set-key-for-mode 'haskell-mode "ee" 'flycheck-explain-error-at-point)
      (evil-leader/set-key-for-mode 'haskell-mode "rR" 'lsp-rename)
      (evil-leader/set-key-for-mode 'haskell-mode "rf" 'lsp-format-buffer)
      (evil-leader/set-key-for-mode 'haskell-mode "ra" 'lsp-ui-sideline-apply-code-actions)
      (evil-leader/set-key-for-mode 'haskell-mode "lr" 'lsp-restart-workspace)
      (evil-leader/set-key-for-mode 'haskell-mode "," 'completion-at-point)
      (evil-leader/set-key-for-mode 'haskell-mode "." 'lsp-describe-thing-at-point)
      (lsp-haskell-set-hlint-on)
      )))
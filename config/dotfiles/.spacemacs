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
  (setq configuration-layer--elpa-archives
    '(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
      ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
      ("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/"))))

(defun dotspacemacs/user-config ()
  (setq exec-path-from-shell-arguments '("-i"))
  (setq lsp-haskell-process-path-hie "haskell-language-server-wrapper")
  (direnv-mode)
  (add-hook 
    'haskell-mode-hook 
    (lambda ()
      (direnv-update-environment)
      (require 'lsp-haskell)
      (lsp)))
  (lsp-haskell-set-hlint-on)
  (with-eval-after-load 'lsp-mode
    (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)))
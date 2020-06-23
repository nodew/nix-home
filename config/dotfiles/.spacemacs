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
              haskell-process-type 'stack-ghci
      )
     rust
     racket
     javascript

     nixos)

   dotspacemacs-additional-packages
   '(lsp-mode
     lsp-ui
     lsp-haskell
     direnv)

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

   dotspacemacs-emacs-command-key "SPC"

   dotspacemacs-ex-command-key ":"
   ))

(defun dotspacemacs/user-init ()
  )

(defun dotspacemacs/user-config ()
  )
{ pkgs, config, ... }:
{
  imports = [
    ../config/base.nix
    ../config/packages.nix
    ../config/zsh.nix
    ../config/git.nix
    ../config/vim.nix
    ../config/emacs.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    NIX_IGNORE_SYMLINK_STORE = 1;
  };
}
# Nix Home

Personal system preference setting manager based on rycee/home-manager

## Prerequisite - install nix

```shell
sh <(curl https://nixos.org/nix/install)
```

## Installation

```shell
git clone https://github.com/nodew/nix-home.git
cd nix-home
ln -s `pwd` ~/.config/nixpkgs
nix-shell --run "home-manager switch"
```
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
nix-shell
home-manager build -f ./machines/wsl2.nix
```
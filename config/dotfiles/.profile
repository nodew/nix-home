if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ] ; then
    . "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi

[ -f ~/.zshrc ] && exec $(which zsh)
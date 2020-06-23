{ pkgs, ... }:
let
    sources = import ../nix/sources.nix {};
in
{
    # services
    services.lorri.enable = true;

    # program modules
    programs.home-manager = {
        enable = true;
        path = toString sources.home-manager;
    };
    
    programs.htop.enable = true;

    programs.direnv = {
        enable = true;
        enableZshIntegration = true;
    };

    programs.tmux = {
        enable = true;
        extraConfig = builtins.readFile dotfiles/tmux.conf;
        keyMode = "vi";
    };

    # extra dotfiles
    home.file = {
        ".profile".source = dotfiles/.profile;
        ".bashrc".source = dotfiles/.bashrc;
    };
}

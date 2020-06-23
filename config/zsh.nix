{ pkgs, ... }:
{
    programs.zsh = {
        enable = true;
        enableAutosuggestions = true;
        history.extended = true;
        oh-my-zsh = {
            enable = true;
            plugins = [
                "git-extras"
                "git"
                "gitfast"
                "github"
            ];
            theme = "ys";
        };
        shellAliases = {
            tns = "tmux new -s";
        };
    };
}
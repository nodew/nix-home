{pkgs, ...}:

with import <nixpkgs> {};
with builtins;
with lib;

{
    home.packages =
        map (name: getAttrFromPath (splitString "." name) pkgs) (fromJSON (readFile ./packages.json));

    programs.git = {
        enable = true;
        userName = "Joe Wang";
        userEmail = "wangqiao11@hotmail.com";
        aliases = {
            unstage = "reset HEAD --";
            pr = "pull --rebase";
            addp = "add --patch";
            comp = "commit --patch";
            co = "checkout";
            ci = "commit";
            cim = "commit -m";
            c = "commit";
            b = "branch";
            p = "push";
            d = "diff";
            a = "add";
            s = "status";
            f = "fetch";
            br = "branch";
            rf = "reflog";
        };
    };

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

    programs.vim = {
        enable = true;
        extraConfig = readFile configs/vimrc;
        settings = {
            relativenumber = true;
            number = true;
        };
        plugins = with pkgs.vimPlugins; [
            sensible
            vim-airline
            nerdtree
            fugitive
            vim-gitgutter
            molokai
        ];
    };

    programs.tmux = {
        enable = true;
        extraConfig = readFile configs/tmux.conf;
        keyMode = "vi";
    };

    programs.htop.enable = true;

    programs.direnv.enable = true;
}

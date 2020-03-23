{pkgs, ...}:

with import <nixpkgs> {};
with builtins;
with lib;
let
  all-hies = import (fetchTarball "https://github.com/infinisil/all-hies/tarball/master") {};
  homePkgs = (map (name:
                      getAttrFromPath (splitString "." name) pkgs)
                  (fromJSON (readFile ./packages.json)));
in
{
    home.sessionVariables = {
        NIX_IGNORE_SYMLINK_STORE = 1;
    };
    
    home.packages = 
        [
            (all-hies.selection { selector = p: { inherit (p) ghc882 ghc865 ghc843; }; })
        ] ++ homePkgs;
    
    services.lorri.enable = true;
    
    programs.htop.enable = true;
    programs.direnv.enable = true;
  
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
}

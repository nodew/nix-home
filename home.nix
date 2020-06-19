let
    sources = import ./nix/sources.nix {};
    pkgs = import sources.nixpkgs {};
    lib = pkgs.lib;
    homePkgs = (map (name:
                      lib.attrsets.getAttrFromPath (lib.splitString "." name) pkgs)
                  (builtins.fromJSON (builtins.readFile ./packages.json)));
in
{
    home.sessionVariables = {
        NIX_IGNORE_SYMLINK_STORE = 1;
    };

    # packages
    home.packages = homePkgs;

    # services
    services.lorri.enable = true;

    # program modules
    programs.home-manager.enable = true;
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
        extraConfig = builtins.readFile dotfiles/.vimrc;
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
        extraConfig = builtins.readFile dotfiles/tmux.conf;
        keyMode = "vi";
    };

    # extra dotfiles
    home.file = {
        ".profile".source = dotfiles/.profile;
        ".bashrc".source = dotfiles/.bashrc;

        ".emacs.d" = {
            source = pkgs.fetchFromGitHub {
                owner = "syl20bnr";
                repo = "spacemacs";
                rev = "d46eacd8";
                sha256 = "1r8q7bnszkrxh4q9l78n6xgxflpc52hcd18d3n9kc5r8xma20387";
            };
            recursive = true;
        };

        ".spacemacs".source = dotfiles/.spacemacs;
    };
}

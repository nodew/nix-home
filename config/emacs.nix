{ pkgs, ... }:
{
    home.packages = with pkgs; [
        emacs
    ];

    home.file = {
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
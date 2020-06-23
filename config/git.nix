{ pkgs, ... }: 
{
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
}
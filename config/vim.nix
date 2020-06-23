{ pkgs, ... }:
{
    programs.vim = {
        enable = true;
        plugins = with pkgs.vimPlugins; [
            sensible
            vim-airline
            nerdtree
            fugitive
            vim-gitgutter
            molokai
        ];
        extraConfig = builtins.readFile dotfiles/.vimrc;
    };
}
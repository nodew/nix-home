{ pkgs, ... }: 
with pkgs;
with lib;
{
    home.packages = 
        (map (name:
                attrsets.getAttrFromPath (splitString "." name) pkgs)
            (builtins.fromJSON (builtins.readFile ./packages.json)));
}
{inputs, pkgs, ...}: {
  imports = [
    ./packages.nix
    ./programs.nix
  ];
  home = {
    stateVersion = "23.11";
    username = "bkerz";
    homeDirectory = "/home/bkerz";
  };
}

{inputs, pkgs, ...}: {
  imports = [
    ./packages.nix
    ./programs.nix
  ];
  nixpkgs.config.allowUnfree = true;
}

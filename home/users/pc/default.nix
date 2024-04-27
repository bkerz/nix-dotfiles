{inputs, pkgs, ...}: {
  imports = [
    ./packages.nix
    ./programs.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [inputs.fenix.overlays.default];
}

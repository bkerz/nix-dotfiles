{
  pkgs,
  inputs,
  lib,
  ...
}: {
  home-manager.sharedModules = [
    inputs.sss.nixosModules.home-manager
  ];
  home-manager.users = {
    bkerz = import ./bkerz {
      inherit pkgs inputs lib;
    };
  };
}

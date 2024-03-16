{
  config,
  pkgs,
  inputs,
  ...
}: let
  bkerz = config.bkerz;
  system = pkgs.system;
in {
	  options.bkerz = with pkgs.lib; {
    username = mkOption {
      type = types.str;
    };
    gitname = mkOption {
      type = types.str;
    };
    gitemail = mkOption {
      type = types.str;
    };
    normalUser = mkOption {
      type = types.bool;
      default = true;
    };
    homepath = mkOption {
      type = types.str;
      default = "/home/bkerz";
    };
    touchpad = mkEnableOption "Enable touchpad this host";
    shell = mkOption {
      type = types.enum [pkgs.zsh pkgs.nushell];
      default = pkgs.zsh;
    };
    dev-env = mkOption {
      type = types.submodule {
        options = {
          rust = mkEnableOption "Enable Rust development environment";
          lua = mkEnableOption "Enable Lua development environment";
          nix = mkEnableOption "Enable Nix development environment";
          php = mkEnableOption "Enable PHP development environment";
          node = mkEnableOption "Enable Node development environment";
          deno = mkEnableOption "Enable Deno development environment";
          python = mkEnableOption "Enable Python3 development environment";
          web = mkEnableOption "Enable Web development environment";
          go = mkEnableOption "Enable Go development environment";
        };
        config = {
          rust = true;
          lua = true;
          nix = true;
          php = true;
          node = true;
          python = true;
          web = true;
        };
      };
      default = {};
    };

    groups = mkOption {
      type = types.listOf types.str;
      default = [];
    };
    extraPackages = mkOption {
      type = types.listOf types.package;
      default = [];
    };
  };
}

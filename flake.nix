	{
  description = "Baker";
  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];

      imports = [./home/users ./hosts];

      perSystem = {
        config,
        pkgs,
        system,
        ...
      }: {
        devShells = {
          default = pkgs.mkShell {
            packages = [pkgs.alejandra pkgs.git];
            name = "nixland";
            DIRENV_LOG_FORMAT = "";
          };

					godot = import ./shells/godot.nix {inherit system inputs;};
        };
        # Nix Formatter
        formatter = pkgs.alejandra;
      };
    };
  inputs = {
		fenix = {                                                                         
			url = "github:nix-community/fenix";                                           
		};
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		rust-overlay = {
			url = "github:oxalica/rust-overlay";
	    inputs.nixpkgs.follows = "nixpkgs";
		};
    flake-parts = {
			url = "github:hercules-ci/flake-parts";
	    inputs.nixpkgs.follows = "nixpkgs";
		};
		agenix = {
			url = "github:ryantm/agenix";
			inputs.nixpkgs.follows = "nixpkgs";
			inputs.home-manager.follows = "hm";
		};
    hm = {
      url = "github:nix-community/home-manager";
	    inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://fufexan.cachix.org"
      "https://cache.privatevoid.net"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "fufexan.cachix.org-1:LwCDjCJNJQf5XD2BV+yamQIMZfcKWR9ISIFy5curUsY="
      "cache.privatevoid.net:SErQ8bvNWANeAvtsOESUwVYr2VJynfuc9JRwlzTTkVg="
    ];
  };
}

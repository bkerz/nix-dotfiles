{
	imports = [
		./home-manager.nix
	];
	programs = {
		steam.enable = true;
		dconf.enable = true;
	};
}

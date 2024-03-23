{
	lib,
	self,
	inputs,
	...
}: {
	home = {
		username = "bkerz";
		homeDirectory = "/home/bkerz";
		stateVersion = "23.11";
	};

	programs.home-manager.enable = true;

}


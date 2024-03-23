{ 
	self,
	inputs, 
	homeImports,
	...
}: {
  flake.nixosConfigurations = let
  	inherit (inputs.nixpkgs.lib) nixosSystem;
		specialArgs = {inherit inputs;};
		inherit (import "${self}/system") desktop;
	in {
		laptop = nixosSystem {
			inherit specialArgs;
			modules =
				desktop
			++ [
				./laptop
				{
					home-manager = {
						users.bkerz.imports = homeImports."bkerz@laptop";
						extraSpecialArgs = {inherit inputs;};
					};
				}
				inputs.agenix.nixosModules.default
			];
		};
	};
}

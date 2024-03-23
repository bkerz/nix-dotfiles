# {inputs, ...}: {
#   imports = [inputs.hm.nixosModule ./users];
# } 
{
	self,
	inputs,
	...
}: let

	extraSpecialArgs = {inherit inputs self;};
	homeImports = {
		"bkerz@laptop" = [
			../.
			./laptop
		];
	};
	inherit (inputs.hm.lib) homeManagerConfiguration;

	pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
in {
	_module.args = {inherit homeImports;};

	flake = {
		homeConfiguration = {
			"bkerz@laptop" = homeManagerConfiguration {
				modules = homeImports."bkerz@laptop";
				inherit pkgs extraSpecialArgs;
			};
		};
	};
}


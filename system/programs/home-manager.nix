{
	inputs,
	...
}: {
	imports = [
		inputs.hm.nixosModules.default
	];

	home-manager = {
		useUserPackages = true;
	};
}

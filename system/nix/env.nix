{pkgs, inputs, ...}: {
	environment.sessionVariables = {
		PATH = [
			"$HOME/.cargo/bin/"
		];
	};
}

{ pkgs, lib, ... }: {
  home.packages = with pkgs; [
		alacritty
		brave
		godot_4
		neovim
		ripgrep

		delta
		nil
		lua-language-server
    # Js
    bun
    nodejs
		deno
		nodePackages.typescript-language-server
		nodePackages.vscode-json-languageserver
		biome
		nodePackages.tailwindcss
		nodePackages.prettier
		nodePackages."@tailwindcss/language-server"
		nodePackages.vscode-html-languageserver-bin
		nodePackages.vscode-css-languageserver-bin

    # C/C++ Develoment
    gcc_multi

    # Rust Develoment
		lld
		mold
    dotter
		ripgrep
		rustc
		fenix.complete.toolchain
		# rustfmt
		# rust-analyzer
		# cargo
	 	# cargo-leptos
	 	# leptosfmt
	 	# trunk
	 	# cargo-make
	 	# cargo-expand
	 	# cargo-generate
	 	# cargo-dist

    # python
    python3

    # Web Develoment
    nodePackages.tailwindcss

    # Utils
    gitui
    scrcpy
    statix
    jq
    neofetch
    xdg-utils
    wev

    # Bluetooth
    bluez
    blueman

    # Browser
		# already defined in configuration.nix

    # GUI?
    pavucontrol
    font-manager
    obs-studio
    screenkey
    poedit

    # Icons
    papirus-icon-theme

    # Audio plugins
    easyeffects

    # Discord
    vesktop
		xwaylandvideobridge

    #Laziness
		steam
		spotify

  ];
}

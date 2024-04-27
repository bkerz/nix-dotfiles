{ pkgs, lib, ... }: {
  home.packages = with pkgs; [
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
		ccls
		rocmPackages.llvm.clang-tools-extra
		scons
		pkg-config

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
		bluez-tools
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
		discord
		xwaylandvideobridge

    #Laziness
		steam
		spotify

		#Gnome
		gnomeExtensions.dash-to-dock

		godot_4
    brave
    neovim
    alacritty

  ];
}

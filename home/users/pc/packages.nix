{ pkgs, lib, ... }:{
  home.packages = with pkgs; [
	obs-studio-plugins.obs-backgroundremoval
		zip
		unzip
		minecraft
		lorien
		wine64
		krita
		opentabletdriver
		fontconfig 
		xorg.libX11
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
		pkg-config
		alsa-lib
		lld
		mold
    dotter
		ripgrep
		# rust
		# rustc
		fenix.stable.toolchain
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
		discord
    vesktop
		xwaylandvideobridge

    #Laziness
		steam
		spotify
		vulkan-loader
		vulkan-tools
		tmux
		dotter
		aseprite

  ];
}

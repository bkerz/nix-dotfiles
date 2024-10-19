{ inputs, pkgs, lib, ... }:{
  home.packages = with pkgs; [
		# unstable.neovim
		xclip
		obsidian
		activitywatch
		telegram-desktop
		openrgb-with-all-plugins
		gh
		vlc
		cmake
		google-chrome
		zls
		zig
		clang
		nodePackages.pnpm
		audacity
		qemu
		winetricks
		cargo-watch
		xclip
		reaper
		wineWowPackages.stagingFull
		yabridge
		yabridgectl
		lmms
		ardour
		dust
		zip
		unzip
		lorien
		krita
		opentabletdriver
		fontconfig 
		xorg.libX11
		alacritty
		brave
		ripgrep

		delta
		nil
		lua-language-server
    # Js
    bun
    nodejs
		deno
		nodePackages.typescript-language-server
		biome
		nodePackages.tailwindcss
		nodePackages.prettier
		nodePackages."@tailwindcss/language-server"
		vscode-langservers-extracted

    # C/C++ Develoment
    # gcc_multi

    # Rust Develoment
		pkg-config
		alsa-lib
		lld
		mold
    dotter
		ripgrep
		# rust
		# rustc
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

    # Browser
		# already defined in configuration.nix

    # GUI?
    pavucontrol
    font-manager
    screenkey
    poedit

    # Icons
    papirus-icon-theme

    # Audio plugins
    easyeffects

    # Discord
		discord
    vesktop

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

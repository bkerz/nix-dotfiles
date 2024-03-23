{ pkgs, lib, ... }: {
  home.packages = with pkgs; [
    # Js
    bun
    nodejs

    # C/C++ Develoment
    gcc_multi

    # Rust Develoment
		lld
		mold
    dotter
		ripgrep
		rustc
		rustfmt
		rust-analyzer
		cargo
    cargo-leptos
    leptosfmt
    trunk
    cargo-make
    cargo-expand
    cargo-generate
    cargo-dist

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

# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix		
    ];


	#virtualisation
	virtualisation.libvirtd.enable = true;
	virtualisation.docker = {
		enable = true;
		rootless = {
			enable = true;
			  setSocketVariable = true;
		};
	};
	programs.virt-manager.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "pc"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Lima";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
   services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
   services.xserver.displayManager.sddm.enable = true;
	 services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.bkerz = {
    isNormalUser = true;
    description = "bkerz";
    extraGroups = [ "networkmanager" "wheel" "docker"];
    packages = with pkgs; [
      firefox
      kate
    #  thunderbird
    ];
  };

  environment.systemPackages = with pkgs; [
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	fonts.packages = with pkgs; [
		(nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "DejaVuSansMono" ]; })
	];
  system.stateVersion = "23.11"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes"];


# 	# Enable OpenGL
#   hardware.opengl = {
#     enable = true;
#     driSupport = true;
#     driSupport32Bit = true;
#   };
#
# # Load nvidia driver for Xorg and Wayland
#   services.xserver.videoDrivers = ["nvidia"];
#   
#   hardware.nvidia.modesetting.enable = true;
#   hardware.nvidia.powerManagement.enable = false;
#   hardware.nvidia.powerManagement.finegrained = false;
#   hardware.nvidia.open = false;
#   hardware.nvidia.nvidiaSettings = true;
# # Special config to load the latest (535 or 550) driver for the support of the 4070 SUPER
#   hardware.nvidia.package = let 
#   rcu_patch = pkgs.fetchpatch {
#     url = "https://github.com/gentoo/gentoo/raw/c64caf53/x11-drivers/nvidia-drivers/files/nvidia-drivers-470.223.02-gpl-pfn_valid.patch";
#     hash = "sha256-eZiQQp2S/asE7MfGvfe6dA/kdCvek9SYa/FFGp24dVg=";
#   };
# in config.boot.kernelPackages.nvidiaPackages.mkDriver {
#     version = "535.154.05";
#     sha256_64bit = "sha256-fpUGXKprgt6SYRDxSCemGXLrEsIA6GOinp+0eGbqqJg=";
#     sha256_aarch64 = "sha256-G0/GiObf/BZMkzzET8HQjdIcvCSqB1uhsinro2HLK9k=";
#     openSha256 = "sha256-wvRdHguGLxS0mR06P5Qi++pDJBCF8pJ8hr4T8O6TJIo=";
#     settingsSha256 = "sha256-9wqoDEWY4I7weWW05F4igj1Gj9wjHsREFMztfEmqm10=";
#     persistencedSha256 = "sha256-d0Q3Lk80JqkS1B54Mahu2yY/WocOqFFbZVBh+ToGhaE=";
#
#     #version = "550.40.07";
#     #sha256_64bit = "sha256-KYk2xye37v7ZW7h+uNJM/u8fNf7KyGTZjiaU03dJpK0=";
#     #sha256_aarch64 = "sha256-AV7KgRXYaQGBFl7zuRcfnTGr8rS5n13nGUIe3mJTXb4=";
#     #openSha256 = "sha256-mRUTEWVsbjq+psVe+kAT6MjyZuLkG2yRDxCMvDJRL1I=";
#     #settingsSha256 = "sha256-c30AQa4g4a1EHmaEu1yc05oqY01y+IusbBuq+P6rMCs=";
#     #persistencedSha256 = "sha256-11tLSY8uUIl4X/roNnxf5yS2PQvHvoNjnd2CB67e870=";
#
#     patches = [ rcu_patch ];
#  };

  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
	hardware.opentabletdriver.enable = true;

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {

    nvidiaSettings = true;
		modesetting.enable = true;
    # # Optionally, you may need to select the appropriate driver version for your specific GPU.
    # package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}

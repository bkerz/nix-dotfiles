{ pkgs, config, ... }: {
  programs = {
    home-manager.enable = true;
    ssh.enable = true;
    gpg = {
      enable = true;
      homedir = "${config.xdg.dataHome}/gnupg";
    };
  };

  # services = {
  #   swayosd = import ../../../modules/swayosd { inherit pkgs; };
  #
  #   gpg-agent = {
  #     enable = true;
  #     enableSshSupport = true;
  #     pinentryFlavor = "gnome3";
  #   };
  # };

  home = {
    # Iterate over script folder and make executable
    file = {
      ".local/bin/wallpaper" = {
        executable = true;
        source = ../../../scripts/wallpaper;
      };
      ".cargo/config" = {
        executable = false;
        source = ../../../.cargo/config;
      };
      ".cargo/cargo-generate.toml" = {
        executable = false;
        source = ../../../.cargo/cargo-generate.toml;
      };
      ".ssh/config".text = ''
        AddKeysToAgent yes

        Host github.com
            IdentityFile ~/.ssh/github

        Host gitlab.com
            IdentityFile ~/.ssh/gitlab
      '';
    };
  };
}

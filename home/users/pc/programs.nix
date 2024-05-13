{ pkgs, config, ... }: {
  programs = {
	 ssh.enable = true;
    gpg = {
      enable = true;
      homedir = "${config.xdg.dataHome}/gnupg";
    };

		starship = {
			enable = true;
		};

		git = {
			enable = true;
			userName = "Beicker Zambrano";
			userEmail = "beicker998@gmail.com";
			ignores = ["*~" "*.swp" ".direnv" "node_modules"];
		};

		zsh = {
			enable = true;
			autosuggestion.enable = true;
			dotDir = ".config/zsh";
			autocd = true;
			syntaxHighlighting = {
				enable = true;
				highlighters = ["main" "brackets" "pattern" "regexp" "root" "line"];
			};
			initExtra = '';
			export PATH=$PATH:$HOME/.cargo/bin
			# Path to your oh-my-zsh installation.
			export ZSH=$HOME/.oh-my-zsh
			
			eval "$(starship init zsh)"
			
			bindkey '^ ' autosuggest-accept
			bindkey "^[[1;5C" forward-word
			bindkey "^[[1;5D" backward-word
			'';

			shellAliases = {
				ls="ls --color";
				ll="ls -l --color";
				la="ls -la --color";
				gst="git status";
				gapa="git add -p";
				gc="git commit -v";
				ga="git add";
			 	gnvim="nvim --listen  .";
			 	dev-godot="nix develop ~/nix-dotfiles#godot -c zsh; cd ~/dev/games";
		};
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

}

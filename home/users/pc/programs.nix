{ pkgs, lib, config, ... }:with lib; let

  cfg = config.programs.zoxide;

  cfgOptions = concatStringsSep " " cfg.options;

in {
  programs = {

	 ssh.enable = true;

	 obs-studio = {
			enable = true;
			plugins = with pkgs; [
				obs-studio-plugins.obs-backgroundremoval
			];
		};

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
			lfs = {
				enable = true;
			};
		};

		neovim = {
			enable = true;
			defaultEditor = true;
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

		zoxide = {
			enable = true;
			enableZshIntegration = true;
		};

		


  };


}

{ pkgs, config, ... }: {
	# gtk = {
	# 	enable = true;
	# 	cursorTheme.name = "Adwaita";
	# 	cursorTheme.package = pkgs.gnome.adwaita-icon-theme;
	# };
		
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
			# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
			# Initialization code that may require console input (password prompts, [y/n]
			# confirmations, etc.) must go above this block; everything else may go below.
			#if [[ -r "${config.xdg.cacheHome}/p10k-instant-prompt-$\{(%):-%n\}.zsh" ]]; then
			  #source "${config.xdg.cacheHome}/p10k-instant-prompt-$\{(%):-%n\}.zsh"
			#fi
			
			export PATH=$PATH:$HOME/.cargo/bin
			
			# Path to your oh-my-zsh installation.
			export ZSH=$HOME/.oh-my-zsh
			
			# User configuration
			
			# export MANPATH="/usr/local/man:$MANPATH"
			
			# You may need to manually set your language environment
			# export LANG=en_US.UTF-8
			
			# Preferred editor for local and remote sessions
			 if [[ -n $SSH_CONNECTION ]]; then
			 export EDITOR='vim';
			 else
			   export EDITOR='nvim';
			 fi
			
			# Compilation flags
			# export ARCHFLAGS="-arch x86_64"
			
			# Set personal aliases, overriding those provided by oh-my-zsh libs,
			# plugins, and themes. Aliases can be placed here, though oh-my-zsh
			# users are encouraged to define aliases within the ZSH_CUSTOM folder.
			# For a full list of active aliases, run `alias`.
			#
			# Example aliases
			# alias zshconfig="mate ~/.zshrc"
			# alias ohmyzsh="mate ~/.oh-my-zsh"
			
			
			
			# Aliases
			alias v="nvim"
			alias fdir='cd $(fd --type directory | fzf)';
			alias projects='cd $(find ~/{{projectsdir}} -maxdepth 1 -type d | fzf)';
			
			
			export NVM_DIR="$HOME/.nvm"
			[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
			[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
			
			# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
			[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
			
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
				vim="";
			 	gnvim="nvim --listen 127.0.0.1:55432 .";
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

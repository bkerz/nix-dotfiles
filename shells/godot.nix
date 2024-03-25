{
		inputs,
		system,
  }:
    let
      pkgs = inputs.nixpkgs.legacyPackages.${system};

      version = "4.3-dev5";
      godot-stable = pkgs.fetchurl {
        # url = "https://github.com/godotengine/godot/releases/download/${version}-stable/Godot_v${version}-stable_linux.x86_64.zip";
				url = "https://github.com/godotengine/godot-builds/releases/download/${version}/Godot_v${version}_linux.x86_64.zip";
        # hash = "sha256-hjEannW3RF60IVMS5gTfH2nHLUZBrz5nBJ4wNWrjdmA=";
				hash = "sha256-I/T4kuCYM2d6yL924guxlBUve0NJBeQ1ouEE/IIbWqU=";
      };

      buildInputs = with pkgs; [
        alsa-lib
        dbus
        fontconfig
        libGL
        libpulseaudio
        libxkbcommon
        makeWrapper
        mesa
        patchelf
        speechd
        udev
        vulkan-loader
        xorg.libX11
        xorg.libXcursor
        xorg.libXext
        xorg.libXfixes
        xorg.libXi
        xorg.libXinerama
        xorg.libXrandr
        xorg.libXrender
      ];

      godot-unwrapped = pkgs.stdenv.mkDerivation {
				name = "godot";
        pname = "godot";

        src = godot-stable;
        nativeBuildInputs = with pkgs; [unzip autoPatchelfHook];
        buildInputs = buildInputs;

        dontAutoPatchelf = false;

        unpackPhase = ''
          mkdir source
          unzip $src -d source
        '';

        installPhase = ''
          mkdir -p $out/bin
          cp source/Godot_v${version}_linux.x86_64 $out/bin/godot
        '';
      };

      godot-bin = pkgs.buildFHSUserEnv {
        name = "godot";
        targetPkgs = pkgs: buildInputs ++ [godot-unwrapped];
        runScript = "godot";
      };
    in 
      pkgs.mkShell {
        buildInputs = [godot-bin];
				packages = with pkgs; [
					tmux
				];
}

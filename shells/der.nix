			with import <nixpkgs> {};
			stdenv.mkDerivation rec {
				 pname = "godot";
				 version = "4.2.1";
				 src = fetchTarball {
				 url = "https://github.com/godotengine/godot/releases/download/${version}-stable/Godot_v${version}-stable_linux.x86_64.zip";
				 # hash = "sha256-hjEannW3RF60IVMS5gTfH2nHLUZBrz5nBJ4wNWrjdmA=";
			 };
			 buildInputs = with pkgs; [
					unzip
			 ];
			 phases = ["unpackPhase" "installPhase"];
			 unpackPhase = "unzip $src";
			 installPhase = ''
			 		mkdir -p $out/bin
					cp -rf $src $out/bin
				 '';
			}



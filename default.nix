{pkgs ? import <nixpkgs> {}}: let
  meta = builtins.fromTOML (builtins.readFile (./. + "/typst.toml"));
  version = meta.package.version;
in
  pkgs.stdenv.mkDerivation {
    pname = "elk-utils";
    inherit version;

    src = ./.;

    installPhase = ''
      mkdir -p $out/elk-utils/$version
      cp -r * $out/elk-utils/$version
    '';
  }

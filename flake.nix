{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    naersk.url = "github:nix-community/naersk";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, flake-utils, naersk, nixpkgs }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = (import nixpkgs) { inherit system; };

        naersk' = pkgs.callPackage naersk { };

      in rec {
        # For `nix build` & `nix run`:
        defaultPackage = naersk'.buildPackage {
          src = ./.;
          name = "status-bar";
          version = "0.1.0";
          buildInputs = with pkgs; [
            wrapGAppsHook4
            rustc
            cargo
            pkg-config
            gtk4-layer-shell
            gtk4
            dbus
            librsvg
          ];
          postInstall = "cp -r style $tmp/status-bar/style";
        };

        # For `nix develop` (optional, can be skipped):
        devShell = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            adwaita-icon-theme
            rustc
            cargo
            pkg-config
            gtk4-layer-shell
            gtk4
            dbus
            librsvg
            dart-sass
          ];
        };
      });
}

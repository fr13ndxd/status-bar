{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    naersk.url = "github:nix-community/naersk";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, flake-utils, naersk, nixpkgs }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = (import nixpkgs) {
          inherit system;
        };

        naersk' = pkgs.callPackage naersk {};

      in rec {
        # For `nix build` & `nix run`:
        defaultPackage = naersk'.buildPackage {
          src = ./.;
          buildInputs = with pkgs; [
            gtk4
            gtk4-layer-shell
            pkg-config
            dbus
            librsvg # librsvg makes svg icons load
          ];

          propagatedBuildInputs = with pkgs; [
            rustc cargo pkg-config gtk4-layer-shell gtk4 dbus librsvg
          ];
        };

        # For `nix develop` (optional, can be skipped):
        devShell = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [ rustc cargo pkg-config gtk4-layer-shell gtk4 dbus librsvg ];
        };
      }
    );
}

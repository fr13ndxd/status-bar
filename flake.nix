{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    zig-overlay.url = "github:mitchellh/zig-overlay";
    zig-overlay.inputs.nixpkgs.follows = "nixpkgs";

    zls-master.url = "github:zigtools/zls";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, zig-overlay, zls-master, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        # zig = zig-overlay.packages.${system}.master;
      in rec {
        formatter = pkgs.nixpkgs-fmt;
        packages.default = packages.status-bar;
        packages.status-bar = pkgs.stdenv.mkDerivation {
          name = "status-bar";
          version = "0.0.0";
          src = ./.;
          nativeBuildInputs = with pkgs; [
            # zig-overlay.packages.${system}.master
            pkg-config
            gtk4
            gtk4-layer-shell
            wrapGAppsHook4
            autoPatchelfHook
            librsvg
          ];
          buildInputs = with pkgs; [ librsvg ];
          dontConfigure = true;
          dontInstall = true;
          buildPhase = ''
            zig build install --cache-dir $(pwd)/.zig-cache --global-cache-dir $(pwd)/.cache --prefix $out -Doptimize=ReleaseFast
          '';
          postPatch = ''
            mkdir .cache
          '';
        };

        devShell = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            # zig-overlay.packages.${system}.master
            zls
            zig_0_15
            # zls-master.packages.${system}.default
            pkg-config
            gtk4
            gtk4-layer-shell
            librsvg
          ];
          buildInputs = with pkgs; [ librsvg ];
        };
      });
}

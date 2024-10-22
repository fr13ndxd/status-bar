{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    zig-overlay.url = "github:mitchellh/zig-overlay";
    zig-overlay.inputs.nixpkgs.follows = "nixpkgs";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, zig-overlay, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        zig = zig-overlay.packages.${system}.master;
        # zig = pkgs.zig;
      in rec {
        formatter = pkgs.nixpkgs-fmt;
        packages.default = packages.status-bar;
        packages.status-bar = pkgs.stdenv.mkDerivation {
          name = "status-bar";
          version = "0.0.0";
          src = ./.;
          nativeBuildInputs = with pkgs; [
            # zig-overlay.packages.${system}.master
            pkgs.zig
            pkg-config
            gtk4
            gtk4-layer-shell
          ];
          dontConfigure = true;
          dontInstall = true;
          buildPhase = ''
            zig build install --cache-dir $(pwd)/.zig-cache --global-cache-dir $(pwd)/.cache --prefix $out -Doptimize=ReleaseFast
          '';
          postPatch = ''
            mkdir .cache
            ln -s ${pkgs.callPackage ./deps.nix { }} .cache/p
          '';
        };

        devShell = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            # zig-overlay.packages.${system}.master
            pkgs.zig
            pkg-config
            gtk4
            gtk4-layer-shell
          ];
        };
      });
}

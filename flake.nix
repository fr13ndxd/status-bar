{
  description = "Zig project flake";

  inputs = {
    zig2nix.url = "github:Cloudef/zig2nix";
    nixpkgs.url = "nixpkgs/master";
  };

  outputs = { zig2nix, nixpkgs, ... }:
    let flake-utils = zig2nix.inputs.flake-utils;
    in (flake-utils.lib.eachDefaultSystem (system:
      let
        # Zig flake helper
        # Check the flake.nix in zig2nix project for more options:
        # <https://github.com/Cloudef/zig2nix/blob/master/flake.nix>
        env = zig2nix.outputs.zig-env.${system} {
          zig = zig2nix.outputs.packages.${system}.zig.master.bin;
        };
        system-triple = env.lib.zigTripleFromString system;
        pkgs = (import nixpkgs) { inherit system; };
      in with builtins;
      with env.lib;
      with env.pkgs.lib; rec {
        # nix build .#target.{zig-target}
        # e.g. nix build .#target.x86_64-linux-gnu
        packages.target = genAttrs allTargetTriples (target:
          env.packageForTarget target ({
            src = ./.;
            nativeBuildInputs = with pkgs; [ pkg-config gtk4 gtk4-layer-shell ];
            buildInputs = with pkgs; [ pkg-config gtk4 gtk4-layer-shell ];

            # Smaller binaries and avoids shipping glibc.
            # zigPreferMusl = true;

            # This disables LD_LIBRARY_PATH mangling, binary patching etc...
            # The package won't be usable inside nix.
            # zigDisableWrap = false;
          } // optionalAttrs (!pathExists ./build.zig.zon) {
            pname = "status-bar";
            version = "0.0.0";
          }));

        # nix build .
        packages.default = packages.target.${system-triple}.override {
          # Prefer nix friendly settings.
          zigPreferMusl = false;
          zigDisableWrap = false;
        };

        # default bundle
        apps.bundle.default = apps.bundle.target.${system-triple};

        # nix run .
        apps.default = env.app [ ] ''zig build run -- "$@"'';

        # nix run .#zon2nix
        apps.zon2nix = env.app [ env.zon2nix ] ''zon2nix "$@"'';

        # nix develop
        devShells.default = env.mkShell {
          nativeBuildInputs = with pkgs; [
            pkg-config
            gtk4
            gtk4-layer-shell
            pkgs.zig
            # zig
            # zig.packages.${system}.master
            librsvg
            # zls-master.packages.${system}.default
          ];
        };
      }));
}

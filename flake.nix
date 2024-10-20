{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zig.url = "github:mitchellh/zig-overlay";
    zls-master = {
      url = "github:zigtools/zls";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, flake-utils, nixpkgs, zig, zls-master, astal }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = (import nixpkgs) { inherit system; };
      in {
        devShell = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            astal.packages.${system}.hyprland.dev

            pkg-config
            gtk4
            gtk4-layer-shell
            pkgs.zig
            # zig
            # zig.packages.${system}.master
            librsvg
            zls-master.packages.${system}.default
          ];
        };
      });
}

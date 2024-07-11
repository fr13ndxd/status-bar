{ pkgs ? import <nixpkgs> { } }:
with pkgs;
mkShell {
  buildInputs = with pkgs; [
    nixpkgs-fmt
    gtk4
    gtk4-layer-shell
    pkg-config
  ];

  env = {
    PKG_CONFIG_PATH="${pkgs.openssl.dev}/lib/pkgconfig";
  };
}

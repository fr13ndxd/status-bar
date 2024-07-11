{ lib, fetchFromGitHub, rustPlatform, pkgs }:

rustPlatform.buildRustPackage rec {
  pname = "status-bar";
  version = "12.1.1";

  src = ../.;

  buildDepencies = with pkgs; [
    pkg-config
  ];

  cargoHash = "sha256-I6aTpCrITuC8BgLjW3+RkeDWdw0sDraoZvkbR2awrU0=";
}

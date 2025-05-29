{
  description = "A Nix-flake-based development environment for Rocq";

  inputs = {
    nixpkgs.url = "git+https://github.com/NixOS/nixpkgs?shallow=1&ref=nixos-unstable";
    flake-utils.url = "git+https://github.com/numtide/flake-utils?shallow=1";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
      in {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            rocq-core
            rocqPackages.stdlib
          ];

          env = {};

          shellHook = ''

          '';
        };
      }
    );
}

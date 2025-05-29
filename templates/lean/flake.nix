{
  description = "A Nix-flake-based development environment for Lean 4";

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
        # change this to change the lean toolchain
        # e.g. "nightly"
        toolchain = "stable";
      in {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            elan
          ];

          env = {};

          shellHook = ''
            echo -e "\033[0;31m$(tput bold)flake:$(tput sgr0)\033[0m toolchain '${toolchain}' selected."
            elan default ${toolchain}
            echo -e "\033[0;31m$(tput bold)flake:$(tput sgr0)\033[0m updating lake..."
            lake update
          '';
        };
      }
    );
}

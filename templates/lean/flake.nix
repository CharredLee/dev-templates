{
  description = "A Nix-flake-based development environment for Lean4";

  inputs = {
    nixpkgs.url = "git+https://github.com/NixOS/nixpkgs?shallow=1&ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    supportedSystems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
    forEachSupportedSystem = f:
      nixpkgs.lib.genAttrs supportedSystems (system:
        f {
          pkgs = import nixpkgs {inherit system;};
        });
    # change this to change the lake toolchain
    # e.g. "nightly"
    toolchain = "stable";
  in {
    devShells = forEachSupportedSystem ({pkgs}: {
      default = pkgs.mkShell {
        packages = with pkgs; [
          elan
        ];
        shellHook = ''
          echo "toolchain '${toolchain}' selected."
          elan default ${toolchain}
          echo "updating lake..."
          lake update
        '';
      };
    });
  };
}

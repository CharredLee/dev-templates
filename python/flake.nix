{
  description = "python development environment template";

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
    version = "3.12";
  in {
    devShells = forEachSupportedSystem (
      {pkgs}: let
        concatMajorMinor = v:
          pkgs.lib.pipe v [
            pkgs.lib.versions.splitVersion
            (pkgs.lib.sublist 0 2)
            pkgs.lib.concatStrings
          ];

        python = pkgs."python${concatMajorMinor version}";
      in {
        default = pkgs.mkShellNoCC {
          venvDir = ".venv";
        };
        packages = [
          python.pkgs.venvShellHook
          python.pkgs.pip
        ];
      }
    );
  };
}

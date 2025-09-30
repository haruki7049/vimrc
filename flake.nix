{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    systems.url = "github:nix-systems/default";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;

      perSystem = { pkgs, ... }: {
        devShells.default = pkgs.mkShell {
          packages = [
            # LSP
            pkgs.nil

            # Editor
            pkgs.vim-full

            # Runner
            pkgs.nushell
            pkgs.just
          ];
        };
      };
    };
}

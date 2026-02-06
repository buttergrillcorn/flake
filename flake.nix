{
  description = "Description for the project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager.url = "github:nix-community/home-manager";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      flake-parts,
      home-manager,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        home-manager.flakeModules.home-manager
      ];

      systems = [ "x86_64-linux" ];

      perSystem =
        {
          config,
          self',
          inputs',
          pkgs,
          system,
          ...
        }:
        {
          formatter = pkgs.nixfmt;

          devShells.default = pkgs.mkShell {
            name = "my-nix-config-shell";

            packages = with pkgs; [
              nil
              nixfmt
              git
            ];

            shellHook = ''
              echo "Welcome to your Nix config development environment!"
              echo "Tools available: nil, nixfmt"
            '';
          };
        };

      flake = {

        nixosConfigurations = {
          laptop = inputs.nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs; };
            modules = [
              ./hosts/laptop
              inputs.home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
              }

              inputs.nixvim.nixosModules.nixvim
            ];
          };
        };

        nixosModules = {
          niri = import ./modules/nixos/niri.nix;
        };
      };
    };
}

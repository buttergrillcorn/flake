{ inputs, ... }: {

  flake = {

    nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
        ./home.nix
      ];
    };

  };

}

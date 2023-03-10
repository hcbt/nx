{
  description = "My first nix flake";

  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-22.11-darwin";
      home-manager.url = "github:nix-community/home-manager";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";
      darwin.url = "github:lnl7/nix-darwin";
      darwin.inputs.nixpkgs.follows = "nixpkgs";
  };
  
  outputs = { self, nixpkgs, home-manager, darwin }: {
    darwinConfigurations."kibiras" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        home-manager.darwinModules.home-manager
        ./hosts/kibiras/default.nix
      ];
    };
  };
}
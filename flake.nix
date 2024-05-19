{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    };
    outputs = inputs: with inputs; let
        system = "x86_64-linux";
    in {
        nixosConfigurations =  {
            nixos =  nixpkgs.lib.nixosSystem {
                # config._module.args = {inherit inputs;};
                inherit system;
                modules = [
                    ./configuration.nix
                ];
            };
        };
        checks."${system}".default = self.nixosConfigurations.nixos.config.system.build.toplevel;
    };
}
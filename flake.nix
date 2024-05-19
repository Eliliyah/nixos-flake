{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/c9b9378674d6c75c5c190da56e66a04bdc80258b";
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
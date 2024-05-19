{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    };
    outputs = inputs: with inputs; let
        system = "x86_64-linux";
        pkgs = import nixpkgs {
            inherit system
        };
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
        checks."${system}".default =  pkgs.nixosTest {
            nodes.machine = { config, pkgs, ... }: {
                imports = [
                  ./configuration.nix
                ];
            };
            testScript = {nodes, ...}: ''
                machine.wait_for_unit("default.target")
            ''
        } ;
    };
}
# Pepengu's NixOS configuration

This is my personal NixOS system configuration. The purpose of repository to make reconfiguring system from 0 by just clonning the repo and running few commands.

## Architecture

### General   
Versions, external modules, and general links are located in ```flake.nix``` and has a coresponding ```flake.lock``` file   
All directories have ```default.nix``` file to help with linking and isolating parts of configuration

### Harware   
Hardware configuration is located in ```NixOS/hardware-configuration.nix``` file

### System   
System configuration is located in ```NixOS/nixos-modules``` directory  
Packages that don't need extra configuration are installed in ```NixOS/nixos-modules/packages.nix```   
All desktop packages are installed and configured in ```NixOS/nixos-modules/desktop``` directory

### Home configuration   
Home configuration is located in ```NixOS/home-manager``` directory  
Wallpapers are located in ```NixOS/home-manager/background``` directory  
All the modules are located in ```NixOS/home-manager/modules``` directory  
Packages that do not need any extra configurations are installed in ```NixOS/home-manager/modules/home-packages```, packages that need litle configuration are installed and configured in their ```.nix``` file, packages that need multifile configurations are located in separate directories

## Usage   
System can be enabled by   
```
nixos-rebuild .#target-name switch 
```
Home configuration can be switched by   
```
home-manager switch --flake .#target-name-username
```

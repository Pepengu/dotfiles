{config, pkgs, ...}: {
  # SOPS configuration for secrets management (user-based)
  # 
  # Setup instructions:
  # 1. Generate age key: nix-shell -p age --run "age-keygen -o ~/.config/sops/age/keys.txt"
  # 2. Copy secrets/secrets.yaml.example to secrets/secrets.yaml
  # 3. Add your secrets to secrets.yaml
  # 4. Encrypt: sops -e -i secrets/secrets.yaml
  # 5. Update secrets/.sops.yaml with your age public key
  # 6. Rebuild: home-manager switch --flake /etc/nixos
  
  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
    
    # Secrets can be accessed via config.sops.secrets.<name>.path
    secrets = {
      # GitHub token for gh CLI (optional - you can also use gh auth login)
      # This will be available at ~/.config/gh/token
      # To use it: export GITHUB_TOKEN=$(cat ~/.config/gh/token) && gh auth status
      github-token = {
        path = "${config.home.homeDirectory}/.config/gh/token";
        mode = "0600";
      };
    };
  };
}

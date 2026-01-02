# Secrets Management with SOPS

This directory contains encrypted secrets managed by [sops-nix](https://github.com/Mic92/sops-nix).

## Initial Setup

### Option 1: Using Age (Recommended)

1. **Generate an age key:**
   ```bash
   nix-shell -p age --run "age-keygen -o ~/.config/sops/age/keys.txt"
   ```
   This will output your public key. Copy it.

2. **Update `.sops.yaml`:**
   - Open `.sops.yaml` in this directory
   - Uncomment the `age:` line
   - Paste your public key after `age: >-`

3. **Create your secrets file:**
   ```bash
   cp secrets.yaml.example secrets.yaml
   ```

4. **Add your secrets:**
   - Edit `secrets.yaml` and add your actual secrets
   - For GitHub token, you can get one from: https://github.com/settings/tokens

5. **Encrypt the file:**
   ```bash
   nix-shell -p sops --run "sops -e -i secrets.yaml"
   ```

6. **Rebuild your system:**
   ```bash
   sudo nixos-rebuild switch --flake /etc/nixos
   ```

### Option 2: Using GPG

1. **Generate a GPG key (if you don't have one):**
   ```bash
   gpg --full-generate-key
   ```

2. **Get your key ID:**
   ```bash
   gpg --list-secret-keys --keyid-format LONG
   ```
   Copy the key ID (the part after `/` on the sec line).

3. **Update `.sops.yaml`:**
   - Open `.sops.yaml` in this directory
   - Uncomment the `gpg:` line
   - Replace `YOUR_GPG_KEY_ID_HERE` with your actual key ID

4. **Follow steps 3-6 from Option 1**

## Using GitHub CLI

After setup, you have two options for GitHub authentication:

### Option A: Use the token from secrets
```bash
export GITHUB_TOKEN=$(cat ~/.config/gh/token)
gh auth status
```

### Option B: Use interactive login (simpler)
```bash
gh auth login
```
This will guide you through the authentication process.

## Adding New Secrets

1. Add the secret to `secrets.yaml` (unencrypted)
2. Encrypt: `nix-shell -p sops --run "sops -e -i secrets.yaml"`
3. Add the secret definition to `secrets.nix`
4. Rebuild your system

## Editing Secrets

```bash
nix-shell -p sops --run "sops secrets.yaml"
```

This will decrypt, open in your editor, and re-encrypt when you save.

## User-Based Configuration

This secrets configuration is now managed via home-manager, making it user-specific rather than system-wide. This means:

- Secrets are decrypted and available only for your user account
- No sudo required for home-manager rebuilds
- Better separation between system and user secrets

## Rebuilding

After making changes to secrets:

```bash
home-manager switch --flake /etc/nixos
```

No need for `sudo` since this is user-based!

## Enabling Secrets Module

The secrets module is currently commented out in `NixOS/home-manager/modules/default.nix` to allow the configuration to build without requiring encrypted secrets.

After you've set up your encrypted `secrets.yaml` file:

1. Uncomment the line in `NixOS/home-manager/modules/default.nix`:
   ```nix
   ./secrets.nix  # Uncomment after setting up secrets
   ```

2. Rebuild:
   ```bash
   home-manager switch --flake /etc/nixos
   ```

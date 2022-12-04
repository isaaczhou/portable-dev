# preinstall
# sudo apt update && sudo apt upgrade -y
# sudo apt install curl -y
# sudo apt install build-essential -y

# install nix
curl -L https://nixos.org/nix/install | sh

# source nix
. ~/.nix-profile/etc/profile.d/nix.sh

# install nix packages
nix-env -iA \
        nixpkgs.zsh \
        nixpkgs.antibody \
        nixpkgs.git \
        nixpkgs.neovim \
        nixpkgs.tmux \
        nixpkgs.stow \
        nixpkgs.yarn \
        nixpkgs.fzf \
        nixpkgs.ripgrep \
        nixpkgs.bat \
        nixpkgs.direnv \


# stow all package
stow git
stow zsh
stow nvim

# add zsh to valid login shells
command -v zsh | sudo tee -a /etc/shells

# change default shell to zsh
sudo chsh -s $(which zsh) $USER

# use antibody to bundle zsh plugins
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

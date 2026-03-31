#!/bin/bash

dotfiles_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
config_dir=${XDG_CONFIG_HOME:-$HOME/.config}

info()    { echo "  [*] $*"; }
success() { echo "  [+] $*"; }
install() { echo "  [~] $*"; }

# configure fish
if ! command -v fish &>/dev/null; then
    install "fish not found — installing via brew..."
    brew install fish
else
    success "fish already installed"
fi

info "Linking fish config and theme..."
mkdir -p $config_dir/fish/themes/
ln -sf "$dotfiles_dir/config/fish/config.fish" "$config_dir/fish/config.fish"
ln -sf "$dotfiles_dir/config/fish/themes/my.theme" "$config_dir/fish/themes/my.theme"
success "fish config linked"

# configure kitty
if ! command -v kitty &>/dev/null; then
    install "kitty not found — installing via installer script..."
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
else
    success "kitty already installed"
fi

info "Linking kitty config..."
mkdir -p $config_dir/kitty/
ln -sf "$dotfiles_dir/config/kitty/kitty.conf" "$config_dir/kitty/kitty.conf"
success "kitty config linked"

# configure zed
if ! command -v zed &>/dev/null; then
    install "zed not found — installing via brew cask..."
    brew install --cask zed
else
    success "zed already installed"
fi

info "Linking zed config..."
mkdir -p $config_dir/zed/themes/
ln -sf "$dotfiles_dir/config/zed/settings.json" "$config_dir/zed/settings.json"
ln -sf "$dotfiles_dir/config/zed/themes/" "$config_dir/zed/themes/"
success "zed config linked"

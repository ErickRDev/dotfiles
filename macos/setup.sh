#!/bin/bash

dotfiles_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
config_dir=${XDG_CONFIG_HOME:-$HOME/.config}

# configure fish
if ! command -v fish &>/dev/null; then
    echo "Fish not found, installing..."
    brew install fish
else
    echo "Fish is installed"
fi

echo "Linking fish config and theme..."

mkdir -p $config_dir/fish/themes/
# symlink fish config and theme
ln -sf "$dotfiles_dir/config/fish/config.fish" "$config_dir/fish/config.fish"
ln -sf "$dotfiles_dir/config/fish/themes/my.theme" "$config_dir/fish/themes/my.theme"

# configure kitty
if ! command -v kitty &>/dev/null; then
    echo "Fish not found, installing..."
    echo "Kitty not found, installing..."
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
else
    echo "Kitty is installed"
fi

echo "Linking kitty config..."

# symlink kitty config and theme
ln -sf "$dotfiles_dir/config/kitty/kitty.conf" "$config_dir/kitty/kitty.conf"

# configure zed
if ! command -v zed &>/dev/null; then
    echo "Zed not found, installing..."
    brew install --cask zed
else
    echo "Zed is installed"
fi

echo "Linking zed config..."

# symlink zed config
ln -sf "$dotfiles_dir/config/zed/settings.json" "$config_dir/zed/settings.json"
ln -sf "$dotfiles_dir/config/zed/themes/" "$config_dir/zed/themes/"

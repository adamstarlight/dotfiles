#!/bin/sh

mkdir -p "$HOME/.config"

PWD=$(dirname "$(readlink -f "$0")")

ln -sfn "$PWD/nvim" "$HOME/.config/nvim"

ln -sfn "$PWD/zsh/.zshrc" "$HOME/.zshrc"
ln -sfn "$PWD/zsh/.zshrc.zni" "$HOME/.zshrc.zni"
ln -sfn "$PWD/zsh/themes/mim.zsh-theme" "$HOME/.oh-my-zsh/themes/mim.zsh-theme"

ln -sfn "$PWD/wezterm" "$HOME/.config/wezterm"

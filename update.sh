#!/bin/sh

## README
# /!\ Ce script de mise à jour est conçu pour mon usage. Ne le lancez pas sans vérifier chaque commande ! /!\

brew update
brew upgrade

brew outdated --cask --greedy --verbose | grep -v '(latest)' | cut -f1 -d" " | xargs -I % sh -c 'brew uninstall --cask %; brew install --cask %;'

# We run neovim-nightly so we need to force the upgrade
brew reinstall neovim

# We run wezterm-nightly so we need to force the upgrade
brew upgrade --cask wez/wezterm/wezterm-nightly --no-quarantine --greedy-latest

mas upgrade

brew cleanup -s

brew doctor

echo ""
echo "==> Update done!"

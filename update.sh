#!/bin/sh

## README
# /!\ Ce script de mise à jour est conçu pour mon usage. Ne le lancez pas sans vérifier chaque commande ! /!\

brew update
brew upgrade

brew outdated --cask --greedy --verbose | grep -v '(latest)' | cut -f1 -d" " | xargs -I % sh -c 'brew uninstall --cask %; brew install --cask %;'

# We run neovim-nightly so we need to force the upgrade
# brew reinstall neovim

# We run wezterm-nightly so we need to force the upgrade
brew upgrade homebrew/cask-versions/wezterm-nightly --no-quarantine --greedy-latest

mas upgrade

brew cleanup -s

brew doctor

# Silence warning about "App from an unidentified developer"
xattr -dr com.apple.quarantine /Applications/firefox.app/
xattr -dr com.apple.quarantine /Applications/Notion.app/
xattr -dr com.apple.quarantine /Applications/Raycast.app/
xattr -dr com.apple.quarantine /Applications/Transmit.app/
xattr -dr com.apple.quarantine /Applications/dbgate.app/
xattr -dr com.apple.quarantine /Applications/WezTerm.app/
xattr -dr com.apple.quarantine /Applications/Raycast.app/
xattr -dr com.apple.quarantine /Applications/1Password.app/
xattr -dr com.apple.quarantine /Applications/Slack.app/
xattr -dr com.apple.quarantine /Applications/Zed.app/

echo ""
echo "==> Update done!"

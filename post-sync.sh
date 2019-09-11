#!/bin/sh

## README
# /!\ Ce script d'installation est conçu pour mon usage. Ne le lancez pas sans vérifier chaque commande ! /!\

echo "====> Restoring preferences"
echo -e "[storage]\nengine = icloud" >> ~/.mackup.cfg

# Force restore without prompting
mackup restore -n

# Save screenshots on the desktop
defaults write com.apple.screencapture location -string "$HOME/Desktop"

echo "Switch to fish shell"
chsh -s /usr/local/bin/fish

echo ""
echo "====> Syncing done!"

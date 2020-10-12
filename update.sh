#!/bin/sh

## README
# /!\ Ce script de mise à jour est conçu pour mon usage. Ne le lancez pas sans vérifier chaque commande ! /!\

brew update
brew upgrade

brew outdated --cask --greedy --verbose | grep -v '(latest)' | cut -f1 -d" " | xargs -I % sh -c 'brew cask uninstall %; brew cask install %;'

mas upgrade

brew cleanup -s

brew doctor

echo ""
echo "====> Update done!"

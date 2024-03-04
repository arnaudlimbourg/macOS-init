<<<<<<< HEAD
#!/bin/sh

## README
# /!\ Ce script d'installation est conçu pour mon usage. Ne le lancez pas sans vérifier chaque commande ! /!\

echo "====> Restoring preferences"
echo -e "[storage]\nengine = icloud" >> ~/.mackup.cfg

# Force restore without prompting
mackup -f restore

# Save screenshots on the desktop
defaults write com.apple.screencapture location -string "$HOME/Desktop"

echo ""
echo "====> Syncing done!"
||||||| (empty tree)
=======
#!/bin/sh

## README
# /!\ Ce script d'installation est conçu pour mon usage. Ne le lancez pas sans vérifier chaque commande ! /!\

echo "====> Restoring preferences"
# echo -e "[storage]\nengine = icloud" >> ~/.mackup.cfg

# Force restore without prompting
mackup -f restore

# Save screenshots on the desktop
defaults write com.apple.screencapture location -string "$HOME/Desktop"

echo ""
echo "====> Syncing done!"
>>>>>>> 3c27cb9 (Update with latest dump)

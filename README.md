**⚠️ Ce script a été conçu pour mes besoins. Avant de l'utiliser pensez bien [à le modifier](https://github.com/arnaudlimbourg/macOS-init#comment-lutiliser) en fonction de vos besoins ! ⚠️**

## Présentation

Voir la présentation détaillée dans mon billet de blog « [automatiser l'installation des applications sur un nouveau Mac](https://nicolas-hoizey.com/2017/05/automatiser-l-installation-des-applications-sur-un-nouveau-mac.html) ».

ℹ️ Si vous n'êtes pas sur macOS mais plutôt sur Ubuntu, vous vous êtes trompé d'endroit. Mais Jean-Yves a une solution similaire pour vous avec son [Ubuntu Installer basé sur Ansible](https://github.com/jygastaud/ubuntu-installer).

## Utilisation

### Installation initiale de l'OS vierge

1. Installez macOS
1. Lancez le Mac App Store et connectez-vous à votre compte

⚠️ Attention, si vous migrez depuis une autre machine ou faites une réinstallation complète, utilisez tant que possible le même _username_, sinon Mackup ne fera pas les bonnes actions pour récupérer les paramètres des applications.

### Première étape

1. Téléchargez la dernière version du projet ([lien direct](https://github.com/arnaudlimbourg/macOS-init/archive/master.zip)) ;
1. Ouvrez les fichiers `run-first.sh` et `Brewfile`, et modifiez ce qui est installé par défaut ;
1. Pensez à changer les lignes `brew cask install dropbox` et `open -a Dropbox` de [`post-sync.sh`](https://github.com/arnaudlimbourg/macOS-init/blob/master/post-sync.sh) en fonction du service Cloud utilisé, ou alors à la supprimer si vous ne voulez pas en utilisez ;
1. À partir de la ligne `## *** CONFIGURATION ***`, le script configure quelques réglages par défaut, à modifier selon vos besoins ;
1. Run file `./run-first.sh`

Le script fonctionnera largement sans votre intervention, sauf :

- pour valider l'installation de Homebrew ;
- pour saisir le mot de passe administrateur pour Homebrew ;
- pour le mot de passe administrateur nécessaire pour Cask ;
- pour certains logiciels qui nécessitent un accès admin ;

Si tout va bien, il se terminera normalement sans erreur, mais en cas d'erreur, vous pourrez relancer le script et seul ce qui n'a pas déjà été installé, sera installé ;

### Seconde étape

Quand le premier script est terminé, et quand vos données sont synchronisées depuis le cloud :

1. Ouvrez le fichier `post-sync.sh` et modifiez la [ligne 7](https://github.com/arnaudlimbourg/macOS-init/blob/master/post-sync.sh#L7) en fonction du service de Cloud choisi, ou laissez-la en commentaire si vous utilisez Dropbox (choix par défaut) ;
2. Run it `./post-sync.sh`

You're all set

### Updates

1. Run `update.sh` to keep your machine humming

## Arnaud's section

The following command will run everything needed on a new machine (or a re-install)

```shell
$ curl -sfL https://raw.githubusercontent.com/arnaudlimbourg/macOS-init/master/run.sh | sh
```

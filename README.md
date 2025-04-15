![Static Badge](https://img.shields.io/badge/Shell-bash-brightgreen?style=plastic&logo=linux)

# browser-watch
browser-watch - Créer et envoyer un rapport de l'historique de navigation web par email

Il  permait  de  créer un compte rendu de l'historique des navigateurs pour l'utilisateur sélectionné et de transmettre ce rapport par email aux responsables légaux choisis.

Les rapports sont envoyés à 00:00 tous les jours, et à chaque extinction de l'ordinateur.

## Table des matières

- 📦 [Prérequis](#prérequis)
- 🚀 [Installation](#installation)
- 🛠️ [Utilisation](#utilisation)
- 🤝 [Contributeurs](#contributeurs)
- 💬 [Retour](#retour)
- 🏷️ [Historique des versions](#historique-des-versions)
- 📝 [Licence](#licence)

## Prérequis

Pour installer le programme vous aurez besoin des dépendances suivante

* wget
* sqlite
* exim4
* mailx

Fonctionne avec tous les systèmes GNU/Linux.

## Installation

Pour Debian

```
        wget -O- https://nfili.github.io/ppa/pubkey.gpg | gpg --dearmor | sudo tee /etc/apt/keyrings/nfili-repo.gpg
        sudo curl -s --compressed -o /etc/apt/sources.list.d/nfili.list "https://nfili.github.io/ppa/nfili.list"
        sudo apt update
        sudo apt install browser-watch
```
## Désinstallation

Pour Debian
```
        sudo apt remove --purge browser-watch
```
## Utilisation

```
        browser-watch [-u, --user utilisateur] [-m, --mailto responsable1,reponsabe2,...]
        browser-watch [-v, --version]
        browser-watch [-h, --help]
```
## Contributeurs

<a href="https://github.com/nfili/tri_photo/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=nfili/tri_photo" />
</a>

## Retour

> Vous pouvez améliorer ce projet, n'hésitez pas à ouvrir une  [Pull Request](https://github.com/nfili/browser-watch/pulls).
- Si vous constatez un bug ou une faute de frappe utilisez la balise "Correction".
- Si vous souhaitez partager des idées pour améliorer ce projet, utilisez la balise « Amélioration ».

<details>
    <summary>Contacter Moi 📨</summary>

### Contact<!-- Required -->
Contactez-moi par e-mail: [nicolasfilippozzi@gmail.com](mailto:nicolasfilippozzi@gmail.com)
<!-- 
* nicolasfilippozzi@gmail.com
* Nicolas Filippozzi
-->
    
</details>

## Historique des versions

* 1.0
  * Première version 

* 1.0.1
  * Modification de l'heure d'execution de la tâche cron

## Licence

Voir le fichier :
* [LICENSE](./LICENSE) du dépôt.

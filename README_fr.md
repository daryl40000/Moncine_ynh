# Moncine pour YunoHost

[![Packaging Format](https://img.shields.io/badge/packaging_format-2.0-blue.svg)](https://doc.yunohost.org/packaging_apps_manifest)
[![Licence paquet](https://img.shields.io/badge/license-GPLv3-blue.svg)](LICENSE)

*[English readme](./README.md)*

> Ce paquet permet d’installer [Moncine](https://github.com/daryl40000/Moncine) sur un serveur [YunoHost](https://yunohost.org).

## Vue d’ensemble

**Moncine** est une application web pour gérer une **dvdthèque personnelle** : films, envies, notes, enrichissement TMDB, import/export CSV, comptes utilisateurs, foyers, prêts entre amis, partage visiteur, questionnaire du soir, listes imprimables, etc.

**Version incluse :** 1.0.0 ([release upstream](https://github.com/daryl40000/Moncine/releases/tag/1.0.0))

## Fonctionnalités principales

- Collection et envies, statistiques, questionnaire du soir
- Catalogue partagé, enrichissement TMDB / OMDB
- Comptes, inscription publique, foyers, amis et groupes
- Import / export CSV, sauvegarde SQLite (admin)
- Stockage médias hors `www/` (`MONCINE_MEDIA_PATH`)

## Avertissements

- **Chemin** : préférez l’installation à la racine du domaine (`/`). Les liens internes sont absolus.
- **Première visite** : créez l’administrateur sur `/premier-compte.php` après l’installation.
- **TMDB** : placez votre clé dans `data/tmdb_api_key.txt` (dossier persistant YunoHost).
- **E-mails** : mot de passe oublié et inscription nécessitent un serveur mail fonctionnel.
- **Sauvegarde** : sauvegardez `moncine.db` avant chaque mise à jour.

## Installation

```bash
sudo yunohost app install https://github.com/VOTRE_COMPTE/Moncine_ynh --debug
```

Puis ouvrez `https://votre-domaine/premier-compte.php`.

## Liens

- Application : <https://github.com/daryl40000/Moncine>
- Release 1.0.5 : <https://github.com/daryl40000/Moncine/releases/tag/1.0.5>
- Documentation packaging YunoHost : <https://yunohost.org/packaging_apps>

## Développement du paquet

```bash
sudo yunohost app install /chemin/vers/Moncine_ynh --debug
sudo yunohost app upgrade moncine -u /chemin/vers/Moncine_ynh --debug
```

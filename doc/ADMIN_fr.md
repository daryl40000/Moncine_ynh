## Administration

- **Comptes utilisateurs** : `/utilisateurs.php` (admin)
- **Foyers** (collection partagée) : `/foyers.php` (admin)
- **Maintenance catalogue** (doublons, sauvegarde base) : `/maintenance-catalogue.php` (admin)
- **Médias volumineux** : `/maintenance-medias.php` (admin)

## Fichiers importants

| Emplacement | Contenu |
|-------------|---------|
| `__INSTALL_DIR__/` | Code PHP (www/, lib/, templates/, sql/) |
| `__DATA_DIR__/moncine.db` | Base SQLite |
| `__DATA_DIR__/tmdb_api_key.txt` | Clé API TMDB |
| `__DATA_DIR__/posters/` | Affiches locales |
| `__DATA_DIR__/media/` | Fichiers volumineux (PDF, exports…) |

## Mise à jour

La mise à jour applique automatiquement les migrations SQL via `lib/cli/migrate.php`. Sauvegardez `moncine.db` avant toute mise à jour.

## Variables d’environnement (PHP-FPM)

Définies dans `/etc/php/__PHP_VERSION__/fpm/pool.d/__APP__.conf` :

| Variable | Rôle |
|----------|------|
| `MONCINE_DATA_PATH` | Dossier des données (`__DATA_DIR__`) |
| `MONCINE_MEDIA_PATH` | Racine des médias volumineux |
| `MONCINE_BASE_URL` | URL publique (e-mails, liens) |
| `MONCINE_TRUST_PROXY` | `1` — IP client derrière Nginx YunoHost |
| `MONCINE_MAIL_FROM` | Expéditeur des e-mails |

Documentation upstream : [Moncine sur GitHub](https://github.com/daryl40000/Moncine)

# Moncine for YunoHost

[![Packaging Format](https://img.shields.io/badge/packaging_format-2.0-blue.svg)](https://doc.yunohost.org/packaging_apps_manifest)
[![Package license](https://img.shields.io/badge/license-GPLv3-blue.svg)](LICENSE)

*[Lire ce readme en français](./README_fr.md)*

> This package installs [Moncine](https://github.com/daryl40000/Moncine) on a [YunoHost](https://yunohost.org) server.

## Overview

**Moncine** is a web app to manage a **personal movie library**: collection, wishlist, ratings, TMDB enrichment, CSV import/export, user accounts, households, loans, visitor sharing, evening quiz, printable lists, and more.

**Bundled version:** 0.9.6 ([upstream release](https://github.com/daryl40000/Moncine/releases/tag/0.9.6))

## Main features

- Collection & wishlist, stats, evening quiz
- Shared catalog, TMDB / OMDB enrichment
- Accounts, public registration, households, friends & groups
- CSV import/export, SQLite backup (admin)
- Media storage outside `www/` (`MONCINE_MEDIA_PATH`)

## Warnings

- **Path**: prefer installing at domain root (`/`). Internal links are absolute.
- **First visit**: create the admin on `/premier-compte.php` after install.
- **TMDB**: put your API key in `data/tmdb_api_key.txt` (YunoHost persistent data dir).
- **E-mail**: password reset and registration need a working mail server.
- **Backup**: back up `moncine.db` before each upgrade.

## Install

```bash
sudo yunohost app install https://github.com/YOUR_ACCOUNT/Moncine_ynh --debug
```

Then open `https://your-domain/premier-compte.php`.

## Links

- Application: <https://github.com/daryl40000/Moncine>
- Release 0.9.6: <https://github.com/daryl40000/Moncine/releases/tag/0.9.6>
- YunoHost packaging docs: <https://yunohost.org/packaging_apps>

## Package development

```bash
sudo yunohost app install /path/to/Moncine_ynh --debug
sudo yunohost app upgrade moncine -u /path/to/Moncine_ynh --debug
```

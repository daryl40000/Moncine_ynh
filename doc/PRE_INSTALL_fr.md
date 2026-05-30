## Chemin d’installation

Installez Moncine à la **racine du domaine** (`/`) si possible. L’application utilise des liens absolus (`/connexion.php`, etc.) : une installation en sous-dossier peut ne pas fonctionner correctement.

## Prérequis

- PHP 8.2+ (PHP 8.4 fourni par le paquet)
- Extension SQLite3
- Environ **200 Mo** d’espace disque pour le code et les données de base

## Multi-instance

Plusieurs instances Moncine peuvent coexister sur le même serveur (domaines ou chemins différents).

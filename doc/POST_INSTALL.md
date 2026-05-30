## Première connexion

1. Ouvrez **https://__DOMAIN____PATH__premier-compte.php**
2. Créez le **compte administrateur** et le foyer par défaut.
3. (Optionnel) Ajoutez votre clé API TMDB dans `__DATA_DIR__/tmdb_api_key.txt` pour l’enrichissement des fiches.

## Clé TMDB

Copiez le fichier exemple puis éditez-le :

```bash
sudo cp __DATA_DIR__/tmdb_api_key.txt.example __DATA_DIR__/tmdb_api_key.txt
sudo nano __DATA_DIR__/tmdb_api_key.txt
```

## E-mails (mot de passe oublié, inscription)

Les e-mails utilisent l’expéditeur `moncine@__DOMAIN__` (configuré automatiquement). Vérifiez que votre serveur YunoHost peut envoyer des mails.

## Données persistantes

- Base SQLite : `__DATA_DIR__/moncine.db`
- Affiches : `__DATA_DIR__/posters/`
- Médias volumineux : `__DATA_DIR__/media/`

**Sauvegardez `moncine.db` avant chaque mise à jour.**

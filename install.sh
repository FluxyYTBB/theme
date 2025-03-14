#!/bin/bash

# Dossier du thème
THEME_DIR="/var/www/pterodactyl/public/themes"
CSS_FILE="$THEME_DIR/alysheberg.css"
PANEL_CSS="/var/www/pterodactyl/public/resources/themes/pterodactyl.css"

# Vérifier que Pterodactyl est bien installé
if [ ! -d "/var/www/pterodactyl" ]; then
    echo "❌ Pterodactyl n'est pas installé dans /var/www/pterodactyl !"
    exit 1
fi

# Créer le dossier des thèmes s'il n'existe pas
mkdir -p $THEME_DIR

# Télécharger le fichier CSS du thème (remplace avec ton lien)
echo "📥 Téléchargement du thème..."
curl -o $CSS_FILE https://pastebin.com/raw/xxxxxxxx  # Remplace par un lien valide !

# Vérifier si le téléchargement a réussi
if [ ! -f "$CSS_FILE" ]; then
    echo "❌ Échec du téléchargement du thème !"
    exit 1
fi

# Ajouter l'import du thème dans le fichier CSS de Pterodactyl
echo "@import url('/themes/alysheberg.css');" >> $PANEL_CSS

# Vider le cache et redémarrer le serveur
echo "🔄 Nettoyage du cache..."
php /var/www/pterodactyl/artisan view:clear
systemctl restart nginx

echo "✅ Thème installé avec succès ! Rafraîchis ton navigateur avec CTRL + F5."
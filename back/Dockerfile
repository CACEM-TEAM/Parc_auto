FROM node:20.17.0

# Crée un dossier de travail
WORKDIR /usr/src/app

# Copie les fichiers package.json et package-lock.json
COPY package*.json ./

# Installe les dépendances
RUN npm install

# Copie le reste du code
COPY . .

# Expose le port (à adapter si besoin)
EXPOSE 3000

# Commande de démarrage
CMD ["node", "index.js"]
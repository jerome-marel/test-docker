FROM node:alpine
# Image de base

WORKDIR /usr/src/app
# Crée dossier si n'existe pas, cd dedans

COPY package*.json ./
# Copie fichiers locaux dans container. Source | Destination
RUN npm install && npm cache clean --force
# Exécuter commandes

COPY . .
# copy tout le dossier, ne pas oublier d'avoir bien crée le dockerignore

EXPOSE 8080
# Quel port du container doit être ouvert

CMD [ "node", "app.js" ]

# une fois le docker-compose et Dockerfile construit 
# lancer la commande docker-compose up

# docker build -t <nom_du_conteneur> .
# docker run -p 8080:8080 <nom_du_conteneur>
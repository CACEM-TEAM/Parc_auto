# Étape 1 : build de l'app
FROM node:20.17.0 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install -g npm@latest
RUN npm install vite@latest @vitejs/plugin-vue@latest
RUN rm -rf node_modules package-lock.json
RUN npm install
COPY . .
RUN npm run build

# Étape 2 : serveur web pour servir les fichiers statiques
FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
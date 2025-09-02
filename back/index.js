// Charge les variables d'environnement dès l’import
import 'dotenv/config';

import express from 'express';
import mysql from 'mysql2';

const app = express();
const port = process.env.PORT ?? 3000;

// Connexion à la base MySQL
const db = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  port: process.env.DB_PORT ? Number(process.env.DB_PORT) : 3306
});

db.connect(err => {
  if (err) {
    console.error('Erreur de connexion à la base de données :', err);
    process.exit(1);
  }
  console.log('Connecté à la base de données MySQL');
});

// Exemple de route API
app.get('/api', (req, res) => {
  res.json({ message: 'API opérationnelle !' });
});

app.listen(port, () => {
  console.log(`Serveur backend démarré sur le port ${port}`);
});

import { Client } from 'pg';


   const client = new Client({
     host: 'localhost', // Por ejemplo, 'localhost' o la dirección IP del servidor
     port: 5432,      // El puerto por defecto de PostgreSQL es 5432
     user: 'postgres',
     password: 'Jimmy&Tommy&Echo15',
     database: 'projectbuddy'
   });

   module.exports = client;
const { Client } = require("pg");

const client = new Client({
   host: "localhost",
   database: "ProjectDB",
   port: 5432,
   user: "postgres",
   password: "20202020",
});

client.connect();
const databaseQueryHandler = async (queryString) => {
   const relation = await client.query(queryString);
   // catch((err) => console.log(err));
   // client.end();
   return relation.rows;
};

module.exports = { client, databaseQueryHandler };

const mysql = require("mysql");

function useDatabase(query, values) {
  return new Promise((resolve, reject) => {
    const connection = mysql.createConnection({
      host: "192.168.255.103",
      user: "u65_7wmzBJtJbL",
      password: "2e96tcReGLX@0x=mj!ow1OPq",
      database: "s65_db",
    });

    connection.connect();

    connection.query(query, values, (err, rows, fields) => {
      if (err) {
        connection.end();
        reject(err);
      } else {
        connection.end();
        resolve(rows);
      }
    });
  });
}

module.exports = { useDatabase };

const router = require("express").Router();
const mysql = require("mysql");

const connection = mysql.createConnection({
      host: "192.168.255.103",
      user: "u65_7wmzBJtJbL",
      password: "2e96tcReGLX@0x=mj!ow1OPq",
      database: "s65_db",
    });

connection.connect((err) => {
  if (err) {
    console.error('Hiba a MySQL kapcsolódás során: ', err);
  } else {
    console.log('MySQL kapcsolódva!');
  }
});

router.get('/getfelhasznalok', (req, res) => {
  const query = 'SELECT user.UserID, username FROM note INNER JOIN user ON user.UserID = note.UserID GROUP BY username';

  connection.query(query, (err, results) => {
    if (err) {
      console.error('Hiba a lekérdezés során: ', err);
      res.status(500).send(`Hiba a lekérdezés során: ${err.message}`);
    } else {
      res.status(200).json(results);
    }
  });
});

router.get('/getjegyzetek/:UserID', (req, res) => {
  const userId = req.params.UserID;
  const query = 'SELECT * FROM note INNER JOIN user ON user.UserID = note.UserID WHERE note.UserID = ?';

  connection.query(query, [userId], (err, results) => {
    if (err) {
      console.error('Hiba a lekérdezés során: ', err);
      res.status(500).send(`Hiba a lekérdezés során: ${err.message}`);
    } else {
      res.status(200).json(results);
    }
  });
});

router.delete('/deleteuser/:UserID', (req, res) => {
  const userId = req.params.UserID;

  const deleteNotesQuery = 'DELETE FROM note WHERE UserID = ?';
  connection.query(deleteNotesQuery, [userId], (err, notesDeleteResult) => {
    if (err) {
      console.error('Hiba a jegyzetek törlése során: ', err);
      res.status(500).send(`Hiba a jegyzetek törlése során: ${err.message}`);
      return;
    }

    const deleteUserQuery = 'DELETE FROM user WHERE UserID = ?';
    connection.query(deleteUserQuery, [userId], (err, userDeleteResult) => {
      if (err) {
        console.error('Hiba a felhasználó törlése során: ', err);
        res.status(500).send(`Hiba a felhasználó törlése során: ${err.message}`);
        return;
      }

      res.status(200).send('Felhasználó és jegyzetei sikeresen törölve.');
    });
  });
});

router.post('/login', (req, res) => {
  const { username, password } = req.body;

  const query = 'SELECT * FROM user WHERE username = ? AND password = ? AND Eligibility = 1';

  connection.query(query, [username, password], (err, results) => {
    if (err) {
      console.error('Hiba a bejelentkezés során: ', err);
      res.status(500).send(`Hiba a bejelentkezés során: ${err.message}`);
    } else {
      if (results.length > 0) {
        res.status(200).send('Sikeres bejelentkezés');
      } else {
        res.status(401).send('Hibás felhasználónév vagy jelszó');
      }
    }
  });
});

module.exports = router;
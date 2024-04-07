const express = require('express');
const os = require('os');

const app = express();

const port = 8081;

app.get('/', (req, res) => {
  const serverInfo = {
    AdresIP: req.connection.remoteAddress,
    NazwaSerwera: os.hostname(),
    Wersja: process.env.APP_VERSION
  };

  res.json(serverInfo);
});

app.listen(port, () => {
  console.log(`Serwer pracuje na porcie ${port}`);
});
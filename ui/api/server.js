const axios = require('axios');
const express = require('express');

const PORT = 3000;
const HOST = '0.0.0.0';

const app = express();

app.use(express.static('public'));

app.get('/cluster-data', async (req, res) => {
  try {
    const ml_res = await axios.get('http://mlservice:4000/cluster-data');
    res.send(ml_res.data);
  } catch (e) {
    res.send(e.message);
  }
});

app.listen(PORT, HOST);
console.log(`Running UI server on http://${HOST}:${PORT}`);

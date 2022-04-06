const axios = require('axios');
const express = require('express');

const PORT = 3000;
const HOST = '0.0.0.0';

const app = express();

app.use(express.static('public'));

app.get('/test-endpoint', async (req, res) => {
  try {
    const ml_res = await axios.get('http://mlservice:4000');
    res.send(ml_res.data);
  } catch (e) {
    res.send(e.message);
  }
});

app.listen(PORT, HOST);
console.log(`Running UI server on http://${HOST}:${PORT}`);

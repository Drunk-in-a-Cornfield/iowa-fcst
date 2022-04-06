const express = require('express');

const PORT = 3000;
const HOST = '0.0.0.0';

const app = express();

app.use(express.static('public'));

app.get('/test-endpoint', (req, res) => res.send('hello world from app!'));

app.listen(PORT, HOST);
console.log(`Running UI server on http://${HOST}:${PORT}`);

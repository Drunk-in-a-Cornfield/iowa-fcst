const express = require('express');

const PORT = 3000;
const HOST = '0.0.0.0';

const app = express();
// app.get('/', (req, res) => res.send('hello world from app'));
app.use(express.static('public'));

app.listen(PORT, HOST);
console.log(`Running UI server on http://${HOST}:${PORT}`);

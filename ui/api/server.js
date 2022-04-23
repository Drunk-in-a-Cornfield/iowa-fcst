const axios = require('axios');
const express = require('express');

const PORT = 3000;
const HOST = '0.0.0.0';

const app = express();

app.use(express.static('public'));

app.get('/cluster-data', async (req, res) => {
  try {
    const ml_res = await axios.get('http://mlservice:4000/cluster-data');
    const raw = ml_res.data;
    const keys = Object.keys(raw.pca_0);

    const data = [];

    for (const key of keys) {
      data.push({
        average_monthly_bottles_sold: raw.average_monthly_bottles_sold[key],
        average_monthly_profit: raw.average_monthly_profit[key],
        average_monthly_sales: raw.average_monthly_sales[key],
        city: raw.cities[key],
        county_no: raw.county_no[key],
        pca_0: raw.pca_0[key],
        pca_1: raw.pca_1[key],
        zip_code: raw.zip_codes[key],
        store_no: key,
        cluster: raw.cluster[key],
      });
    }

    res.send(data);
  } catch (e) {
    res.send(e.message);
  }
});

app.get('/forecast', async (req, res) => {
  try {
    const { getData } = require('./dbClient');
    const db_res = await getData();
    console.log('db_res:', db_res);

    const today = new Date();
    const ml_res = await axios.get('http://mlservice:4000/forecast');
    res.send({
      db: db_res,
      mlservice: ml_res.data.map((d, i) => {
        const date = new Date(new Date(today).setDate(today.getDate() + i));
        return {
          date: `${date.getFullYear()}-${date.getMonth()+1}-${date.getDate()}`,
          value: d,
        };
      }),
    });
  } catch (e) {
    console.log(e.message);
    res.send(e.message);
  }
});

app.listen(PORT, HOST);
console.log(`Running UI server on http://${HOST}:${PORT}`);

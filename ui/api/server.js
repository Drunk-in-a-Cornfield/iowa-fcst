const axios = require('axios');
const express = require('express');

const { getLastDateOfActual, getLastYearActuals } = require('./dbClient');

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
    const county_string = req.query.county_string;
    const latest_actual_date = await getLastDateOfActual(county_string);

    const [db_res, ml_res] = await Promise.all([
      getLastYearActuals(county_string, latest_actual_date),
      axios.get('http://mlservice:4000/forecast', {
        params: {
          county_string: county_string,
          date_zero: new Date(latest_actual_date).toUTCString(),
        },
      }),
    ]);

    const last_actual = new Date(latest_actual_date);

    res.send({
      db: db_res,
      mlservice: {
        deep_learning_fcst: ml_res.data.deep_learning_fcst.map((d, i) => {
          const date = new Date(
            new Date(last_actual).setDate(last_actual.getDate() + i)
          );
          return {
            date: date.getTime(),
            value: parseInt(d),
          };
        }),
        random_forest_regressor: (() => {
          return ml_res.data.random_forest_regressor.map((d, i) => {
            const date = new Date(
              new Date(last_actual).setDate(last_actual.getDate() + i)
            );
            return {
              date: date.getTime(),
              value: parseInt(d),
            };
          });
        })(),
      },
    });
  } catch (e) {
    console.log(e.message);
    res.send(e.message);
  }
});

app.listen(PORT, HOST);
console.log(`Running UI server on http://${HOST}:${PORT}`);

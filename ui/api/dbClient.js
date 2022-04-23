const client = require('knex')({
  client: 'pg',
  connection: {
    host: 'database',
    port: 5432,
    user: 'root',
    password: 'root',
    database: 'liquor_sales',
  },
});

const getData = async () => {
  const result = await client
    .select('Store Name', 'City')
    .from('salesdata')
    .where({
      'Invoice/Item Number': 'S29198800001',
    })
    .limit(10);
  return result;
};

module.exports = {
  getData,
};

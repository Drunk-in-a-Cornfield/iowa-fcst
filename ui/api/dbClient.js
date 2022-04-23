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

const getLastDateOfActual = async (county_string) => {
  const latest_actual_date_result = await client
    .distinct('Date')
    .from('salesdata2')
    .where({ county__c: county_string.toUpperCase() })
    .orderBy('Date', 'desc')
    .limit(1);

  const latest_actual_date = latest_actual_date_result[0].Date;

  return latest_actual_date;
};

const getLastYearActuals = async (county_string, latest_actual_date) => {
  const start_date = new Date(
    new Date(latest_actual_date).setDate(latest_actual_date.getDate() - 30)
  );

  const results = await client
    .select('date__c', 'county__c')
    .sum('sale_dollars__c')
    .from('salesdata2')
    .where({
      county__c: county_string.toUpperCase(),
    })
    .andWhere('date__c', '>=', start_date)
    .groupBy('county__c', 'date__c')
    .orderBy('date__c', 'asc');

  return results.map((r) => {
    const date = new Date(r.date__c);
    return {
      date: date.getTime(),
      value: parseInt(r.sum),
    };
  });
};

module.exports = {
  getLastDateOfActual,
  getLastYearActuals,
};

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

const getLastYearActuals = async (county_name) => {
  const latest_actual_date_result = await client
    .distinct('Date')
    .from('salesdata2')
    .where({ county__c: county_name.toUpperCase() })
    .orderBy('Date', 'desc')
    .limit(1);

  const latest_actual_date = latest_actual_date_result[0].Date;
  const year_ago_date = new Date(
    new Date(latest_actual_date).setDate(latest_actual_date.getDate() - 365)
  );

  const results = await client
    .select('date__c', 'county__c')
    .sum('sale_dollars__c')
    .from('salesdata2')
    .where({
      county__c: county_name.toUpperCase(),
    })
    .andWhere('date__c', '>=', year_ago_date)
    .groupBy('county__c', 'date__c')
    .orderBy('date__c', 'asc');

  return results.map((r) => ({
    date: `${r.date__c.getFullYear()}-${r.date__c.getMonth()+1}-${r.date__c.getDate()}`,
    value: parseInt(r.sum),
  }));
};

module.exports = {
  getLastYearActuals,
};

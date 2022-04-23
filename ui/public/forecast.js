const useForecast = () => {
  // set up the margins
  const MARGIN = { top: 20, right: 50, bottom: 40, left: 40 };
  const WIDTH = 960 - MARGIN.left - MARGIN.right;
  const HEIGHT = 500 - MARGIN.top - MARGIN.bottom;
  const LOADING_MESSAGE = '<br /><br /><br />loading data..';

  const renderAxes = (props) => {
    const { svg, xScale, yScale } = props;

    // create the x-axis
    const xAxisGroup = svg.append('g').attr('id', 'x-axis');
    const formatAxisLabel = d3.timeFormat('%m/%d/%y');

    xAxisGroup
      .attr('class', 'x axis')
      .attr('transform', `translate(0,${HEIGHT})`)
      .call(d3.axisBottom(xScale).tickFormat(formatAxisLabel));

    xAxisGroup
      .append('text')
      .attr('class', 'x label')
      .attr('text-anchor', 'middle')
      .attr(
        'transform',
        `translate(${
          (WIDTH - MARGIN.left - MARGIN.right) / 2 + MARGIN.left
        }, 40)`
      )
      .style('fill', 'black')
      .text('Date');

    // create the y-axis
    const yAxisGroup = svg.append('g').attr('id', 'y-axis');

    yAxisGroup
      .attr('class', 'y axis')
      .attr('transform', `translate(${MARGIN.left},0)`)
      .call(d3.axisLeft(yScale));

    yAxisGroup
      .append('text')
      .attr('class', 'y label')
      .attr('text-anchor', 'middle')
      .attr('transform', `translate(-60,${HEIGHT / 2}) rotate(-90)`)
      .style('fill', 'black')
      .text('Liquor Sales ($)');
  };

  const renderLinechartPoints = (props) => {
    const { svg, actual_records, fcst_records, xScale, yScale, colorScale } =
      props;

    const tooltip = d3
      .select('div#linechart-container')
      .append('div')
      .attr('class', 'tooltip')
      .style('opacity', 0);

    svg
      .selectAll('.dot-act')
      .data(actual_records)
      .enter()
      .append('circle')
      .attr('class', 'dot-act')
      .attr('r', 3.5)
      .attr('cx', (d) => xScale(new Date(d.date)))
      .attr('cy', (d) => yScale(d.value))
      .style('fill', 'black')
      .on('mouseover', (evt, d) => {
        tooltip.transition().duration(200).style('opacity', 0.9);
        tooltip
          .html(
            `
            Date: ${new Date(d.date).toLocaleString('en-US', {
              year: '2-digit',
              month: '2-digit',
              day: '2-digit',
            })}
            <br />Sales: $${d.value}
          `
          )
          .style('left', `${evt.pageX + 15}px`)
          .style('top', `${evt.pageY + 5}px`);
      })
      .on('mouseout', (e) => {
        tooltip.transition().duration(500).style('opacity', 0);
      });

    svg
      .append('path')
      .datum(actual_records)
      .attr('fill', 'none')
      .attr('stroke', 'black')
      .attr('stroke-width', 1.5)
      .attr('class', 'line-act')
      .attr(
        'd',
        d3
          .line()
          .x((d) => xScale(new Date(d.date)))
          .y((d) => yScale(d.value))
      );

    for (const [index, record] of Object.values(fcst_records).entries()) {
      svg
        .selectAll('.dot-fcst-dl')
        .data(record)
        .enter()
        .append('circle')
        .attr('class', `dot-fcst-${index}`)
        .attr('r', 3.5)
        .attr('cx', (d) => xScale(new Date(d.date)))
        .attr('cy', (d) => yScale(d.value))
        .style('fill', colorScale(index))
        .on('mouseover', (evt, d) => {
          tooltip.transition().duration(200).style('opacity', 0.9);
          tooltip
            .html(
              `
              Date: ${new Date(d.date).toLocaleString('en-US', {
                year: '2-digit',
                month: '2-digit',
                day: '2-digit',
              })}
              <br />Forecasted Sales: $${d.value}
            `
            )
            .style('left', `${evt.pageX + 15}px`)
            .style('top', `${evt.pageY + 5}px`);
        })
        .on('mouseout', (e) => {
          tooltip.transition().duration(500).style('opacity', 0);
        });

      svg
        .append('path')
        .datum(record)
        .attr('fill', 'none')
        .attr('stroke', colorScale(index))
        .attr('stroke-width', 1.5)
        .attr('class', `line-fcst-${index}`)
        .attr(
          'd',
          d3
            .line()
            .x((d) => xScale(new Date(d.date)))
            .y((d) => yScale(d.value))
        );
    }
  };

  const renderChart = (props) => {
    const {
      actual_records,
      fcst_records,
      min_date,
      max_date,
      min_sales,
      max_sales,
    } = props;

    linechartDiv.innerHTML = '';

    // create the svg
    const svg = d3
      .select('div#linechart-container')
      .append('svg')
      .attr('width', WIDTH + MARGIN.left + MARGIN.right)
      .attr('height', HEIGHT + MARGIN.top + MARGIN.bottom)
      .attr('id', 'svg-b')
      .append('g')
      .attr('transform', `translate(${MARGIN.left},${MARGIN.top})`);

    // scalers
    const xScale = d3
      .scaleTime()
      .domain([min_date, max_date])
      .range([MARGIN.left, WIDTH - MARGIN.right]);

    const yScale = d3
      .scaleLinear()
      .domain([min_sales, max_sales])
      .range([HEIGHT, 0]);

    const colorScale = d3.scaleOrdinal(d3.schemeCategory10);

    // render chart components
    renderAxes({ svg, xScale, yScale });
    renderLinechartPoints({
      svg,
      actual_records,
      fcst_records,
      xScale,
      yScale,
      colorScale,
    });
  };

  const renderCountySelector = () => {};

  mainDiv.innerHTML = '';

  const linechartDiv = document.createElement('div');
  linechartDiv.id = 'linechart-container';
  mainDiv.appendChild(linechartDiv);

  linechartDiv.innerHTML = LOADING_MESSAGE;

  d3.json('/forecast?county_string=POLK').then((data) => {
    console.log('data:', data);

    linechartDiv.innerHTML = '';

    const actual_records = data.db;
    const fcst_records = data.mlservice;

    const min_date = new Date(
      Math.min(
        d3.min(actual_records, (d) => d.date),
        ...Object.values(fcst_records).map((arr) => d3.min(arr, (d) => d.date))
      )
    );
    const max_date = new Date(
      Math.max(
        d3.max(actual_records, (d) => d.date),
        ...Object.values(fcst_records).map((arr) => d3.max(arr, (d) => d.date))
      )
    );

    const min_sales = Math.min(
      d3.min(actual_records, (d) => d.value),
      ...Object.values(fcst_records).map((arr) => d3.min(arr, (d) => d.value))
    );
    const max_sales = Math.max(
      d3.max(actual_records, (d) => d.value),
      ...Object.values(fcst_records).map((arr) => d3.max(arr, (d) => d.value))
    );

    renderChart({
      actual_records,
      fcst_records,
      min_date,
      max_date,
      min_sales,
      max_sales,
    });

    renderCountySelector();
  });
};

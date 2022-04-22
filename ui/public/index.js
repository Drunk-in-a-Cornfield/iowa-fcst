// set up the margins
const MARGIN = { top: 20, right: 50, bottom: 40, left: 40 };
const WIDTH = 960 - MARGIN.left - MARGIN.right;
const HEIGHT = 500 - MARGIN.top - MARGIN.bottom;
const LOADING_MESSAGE = '<br /><br /><br />loading data..';

const useScatterPlot = () => {
  const renderAxes = (props) => {
    const { svg, xScale, yScale } = props;

    // create the x-axis
    const xAxisGroup = svg.append('g').attr('id', 'x-axis');

    xAxisGroup
      .attr('class', 'x axis')
      .attr('transform', `translate(0,${HEIGHT})`)
      .call(d3.axisBottom(xScale));

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
      .text('PCA-0');

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
      .attr('transform', `translate(-40,${HEIGHT / 2}) rotate(-90)`)
      .style('fill', 'black')
      .text('PCA-1');
  };

  const renderScatterplotPoints = (props) => {
    const { svg, records, xScale, yScale, colorScale } = props;

    const tooltip = d3
      .select('div#scatterplot-container')
      .append('div')
      .attr('class', 'tooltip')
      .style('opacity', 0);

    svg
      .selectAll('.dot')
      .data(records)
      .enter()
      .append('circle')
      .attr('class', 'dot')
      .attr('r', 3.5)
      .attr('cx', (d) => xScale(d.pca_0))
      .attr('cy', (d) => yScale(d.pca_1))
      .style('fill', (d) => colorScale(d.cluster))
      .on('mouseover', (evt, d) => {
        tooltip.transition().duration(200).style('opacity', 0.9);
        tooltip
          .html(
            `
            <u>Store #${d.store_no}</u>
            <br />cluster_no: ${d.cluster}
            <br />city: ${d.city.replace('city_', '')}
            <br />zip_code: ${d.zip_code.replace('zip_code_', '')}
            <br />county_no: ${d.county_no.replace('county_number_', '')}
            <br /><br />average_monthly_bottles_sold: ${
              d.average_monthly_bottles_sold
            }
            <br />average_monthly_profit: ${d.average_monthly_profit}
            <br />average_monthly_sales: ${d.average_monthly_sales}
            <br /><br />(pca_0, pca_1): (${d.pca_0}, ${d.pca_1})
          `
          )
          .style('left', `${evt.pageX + 15}px`)
          .style('top', `${evt.pageY + 5}px`);
      })
      .on('mouseout', (e) => {
        tooltip.transition().duration(500).style('opacity', 0);
      });
  };

  const renderChart = (props) => {
    const { records, min_pca_0, max_pca_0, min_pca_1, max_pca_1 } = props;

    scatterplotDiv.innerHTML = '';

    // create the svg
    const svg = d3
      .select('div#scatterplot-container')
      .append('svg')
      .attr('width', WIDTH + MARGIN.left + MARGIN.right)
      .attr('height', HEIGHT + MARGIN.top + MARGIN.bottom)
      .attr('id', 'svg-a')
      .append('g')
      .attr('transform', `translate(${MARGIN.left},${MARGIN.top})`);

    // scalers
    const xScale = d3
      .scaleLinear()
      .domain([min_pca_0, max_pca_0])
      .range([MARGIN.left, WIDTH - MARGIN.right]);

    const yScale = d3
      .scaleLinear()
      .domain([min_pca_1, max_pca_1])
      .range([HEIGHT, 0]);

    const colorScale = d3.scaleOrdinal(d3.schemeCategory10);

    // render chart components
    renderAxes({ svg, xScale, yScale });
    renderScatterplotPoints({ svg, records, xScale, yScale, colorScale });
  };

  const renderZoomTools = (props) => {
    const { records, min_pca_0, max_pca_0, min_pca_1, max_pca_1 } = props;

    // create the container for the zoom tools
    const zoomToolsDiv = document.createElement('div');
    zoomToolsDiv.id = 'zoom-tools-container';

    // create the "zoom in" button
    const zoomButton = document.createElement('button');
    zoomButton.id = 'btn-zoom';
    zoomButton.innerHTML = 'Zoom in';

    zoomButton.onclick = () => {
      d3.select('#svg-a').remove();
      scatterplotDiv.innerHTML = LOADING_MESSAGE;
      renderChart({ records, min_pca_0, max_pca_0, min_pca_1, max_pca_1: 20 });
    };

    // create the "reset" button
    const resetButton = document.createElement('button');
    resetButton.id = 'btn-reset';
    resetButton.innerHTML = 'Reset zoom';
    resetButton.onclick = () => {
      d3.select('#svg-a').remove();
      scatterplotDiv.innerHTML = LOADING_MESSAGE;
      renderChart({ records, min_pca_0, max_pca_0, min_pca_1, max_pca_1 });
    };

    // add the zoom tools to the DOM
    zoomToolsDiv.appendChild(zoomButton);
    zoomToolsDiv.appendChild(resetButton);
    mainDiv.appendChild(zoomToolsDiv);
  };

  const renderUserNotes = () => {
    const notesDiv = document.createElement('div');
    notesDiv.id = 'notes-container';

    notesDiv.innerHTML = `
      <u>Usage Notes</u>
      <ul>
      <li>Mouseover the data points for more details.</li>
      <li>The outlier causes the visualization to be difficult to read. Click on the "Zoom in" button to see a better view.</li>
      </ul>
    `;

    mainDiv.appendChild(notesDiv);
  };

  mainDiv.innerHTML = '';
  const scatterplotDiv = document.createElement('div');
  scatterplotDiv.id = 'scatterplot-container';
  mainDiv.appendChild(scatterplotDiv);

  scatterplotDiv.innerHTML = LOADING_MESSAGE;

  // load the data and build scatter plot
  d3.json('/cluster-data').then((records) => {
    scatterplotDiv.innerHTML = '';

    // find min/max x- and y- values
    let min_pca_0 = null;
    let max_pca_0 = null;
    let min_pca_1 = null;
    let max_pca_1 = null;

    for (const record of records) {
      if (min_pca_0 === null || record.pca_0 < min_pca_0)
        min_pca_0 = record.pca_0;

      if (max_pca_0 === null || record.pca_0 > max_pca_0)
        max_pca_0 = record.pca_0;

      if (min_pca_1 === null || record.pca_1 < min_pca_1)
        min_pca_1 = record.pca_1;

      if (max_pca_1 === null || record.pca_1 > max_pca_1)
        max_pca_1 = record.pca_1;
    }

    renderChart({ records, min_pca_0, max_pca_0, min_pca_1, max_pca_1 });
    renderZoomTools({ records, min_pca_0, max_pca_0, min_pca_1, max_pca_1 });
    renderUserNotes();
  });
};

const useForecast = () => {
  mainDiv.innerHTML = '<br /><br /><br />forecast data to be inserted here';
};

const mainDiv = document.querySelector('div#main');

const chartswitcherDiv = document.querySelector('div#chartswitcher');

const scatterplotButton = document.createElement('button');
scatterplotButton.id = 'btn-scatterplot';
scatterplotButton.innerHTML = 'Use Scatterplot';
scatterplotButton.onclick = useScatterPlot;

const forecastButton = document.createElement('button');
forecastButton.id = 'btn-forecast';
forecastButton.innerHTML = 'Use Forecast Chart';
forecastButton.onclick = useForecast;

chartswitcherDiv.appendChild(scatterplotButton);
chartswitcherDiv.appendChild(forecastButton);

// default to scatter plot
useScatterPlot();

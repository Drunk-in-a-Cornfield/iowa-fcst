// set up the margins
const MARGIN = { top: 20, right: 50, bottom: 40, left: 40 };
const WIDTH = 960 - MARGIN.left - MARGIN.right;
const HEIGHT = 500 - MARGIN.top - MARGIN.bottom;
const LOADING_MESSAGE = '<br /><br /><br />loading data..';

// helper functions

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
    .attr('x', (WIDTH - MARGIN.left - MARGIN.right) / 2 + MARGIN.left)
    .attr('y', HEIGHT + 40)
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
    .attr('transform', `translate(-20,${HEIGHT / 2 + MARGIN.top}) rotate(-90)`)
    .text('PCA-1');
};

const renderScatterplotPoints = (props) => {
  const { svg, records, xScale, yScale, colorScale } = props;

  svg
    .selectAll('.dot')
    .data(records)
    .enter()
    .append('circle')
    .attr('class', 'dot')
    .attr('r', 3.5)
    .attr('cx', (d) => xScale(d.pca_0))
    .attr('cy', (d) => yScale(d.pca_1))
    .style('fill', (d) => colorScale(d.cluster));
};

const renderChart = (props) => {
  const { records, min_pca_0, max_pca_0, min_pca_1, max_pca_1 } = props;

  mainDiv.innerHTML = '';

  // create the svg
  const svg = d3
    .select('div#main')
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
  zoomButton.id = 'zoom-button';
  zoomButton.innerHTML = 'Zoom in';

  zoomButton.onclick = () => {
    d3.select('#svg-a').remove();
    mainDiv.innerHTML = LOADING_MESSAGE;
    renderChart({ records, min_pca_0, max_pca_0, min_pca_1, max_pca_1: 20 });
  };

  // create the "reset" button
  const resetButton = document.createElement('button');
  resetButton.id = 'reset-button';
  resetButton.innerHTML = 'Reset zoom';
  resetButton.onclick = () => {
    d3.select('#svg-a').remove();
    mainDiv.innerHTML = LOADING_MESSAGE;
    renderChart({ records, min_pca_0, max_pca_0, min_pca_1, max_pca_1 });
  };

  // add the zoom tools to the DOM
  zoomToolsDiv.appendChild(zoomButton);
  zoomToolsDiv.appendChild(resetButton);
  document.body.appendChild(zoomToolsDiv);
};

const mainDiv = document.querySelector('#main');
mainDiv.innerHTML = LOADING_MESSAGE;

// load the data and build scatter plot
d3.json('/cluster-data').then((records) => {
  mainDiv.innerHTML = '';
  console.log('records:', records);

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
});

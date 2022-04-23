const mainDiv = document.querySelector('div#main');

const chartswitcherDiv = document.querySelector('div#chartswitcher');

const forecastButton = document.createElement('button');
forecastButton.id = 'btn-forecast';
forecastButton.innerHTML = 'Load Forecast Chart';
forecastButton.onclick = useForecast;

const scatterplotButton = document.createElement('button');
scatterplotButton.id = 'btn-scatterplot';
scatterplotButton.innerHTML = 'Load Scatterplot';
scatterplotButton.onclick = useScatterPlot;

chartswitcherDiv.appendChild(forecastButton);
chartswitcherDiv.appendChild(scatterplotButton);

// default to forecast chart
useForecast();

console.log('counties:', counties);

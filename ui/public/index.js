const mainDiv = document.querySelector('div#main');

const chartswitcherDiv = document.querySelector('div#chartswitcher');

const forecastButton = document.createElement('button');
forecastButton.id = 'btn-forecast';
forecastButton.className = 'btn-switcher-clicked';
forecastButton.innerHTML = 'ML Forecast Chart';
forecastButton.onclick = () => {
  forecastButton.className = 'btn-switcher-clicked';
  scatterplotButton.className = 'btn-switcher';
  useForecast();
};

const scatterplotButton = document.createElement('button');
scatterplotButton.id = 'btn-scatterplot';
scatterplotButton.className = 'btn-switcher';
scatterplotButton.innerHTML = 'K-Means Scatterplot';
scatterplotButton.onclick = () => {
  scatterplotButton.className = 'btn-switcher-clicked';
  forecastButton.className = 'btn-switcher';
  useScatterPlot();
};

chartswitcherDiv.appendChild(forecastButton);
chartswitcherDiv.appendChild(scatterplotButton);

// default to forecast chart
useForecast();

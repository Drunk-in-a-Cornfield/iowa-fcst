const titleDiv = document.querySelector('#title');
titleDiv.innerHTML = 'Drunk in a Cornfield';

const mainDiv = document.querySelector('#main');
mainDiv.innerHTML = 'main content here';

(async () => {
  const res = await axios.get('/cluster-data');
  console.log(res.data);
})();

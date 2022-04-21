DESCRIPTION

Our project is wrapped up as a Docker (docker-compose) application, with each
directory corresponding to a discrete service:

- database
  - an instance of PostgreSQL which contains our raw data and the 
    cleaned/preprocessed data
  - on first launch, two tables are built and then stored in a docker volume:
    - salesdata: the raw data loaded from Iowa_Liquor_Sales.csv
    - salesdata2: the preprocessed data
- eda
  - this directory does not run an actual service, but contains a SQL script
    and a Jupyter Notebook which were used in preprocessing
  - this work was packaged up as a SQL script in the database service which
    runs the first time the database is created
- mlservice
  - this is where the bulk of the clustering and forecasting work is done
  - contains a scripts directory which holds our forecasting scripts
  - contains a modules directory which has Python modules we wrote for clustering
    and manipulating the data such that we could visualize it with d3
    - data is cached in Pickle files so that it does not need to be 
      recalculated each time the application is launched
  - contains a Flask server which makes the data available to the front end
- pgadmin
  - we used pgadmin to explore the data
- ui
  - the front end for our visualization work
  - contains the HTML/CSS/JavaScript which runs our d3.js-based visualization

Our code is hosted in a repository on GitHub. The repository will be opened to
public during the grading period.
https://github.com/Drunk-in-a-Cornfield/iowa-fcst

INSTALLATION

All of our services are Dockerized. The only dependencies which are required to
be installed on the local machine are Docker and Docker Compose.

1. Install Docker
   - https://docs.docker.com/get-docker/
     - On EC2 with Ubuntu 20.04, all we needed was: 
       sudo apt install docker.io docker-compose
   - https://docs.docker.com/engine/install/linux-postinstall/
     - Linux post-install steps make it so you don't need to use sudo with docker
       commands
2. Install Docker Compose
   - https://docs.docker.com/compose/install/
3. Download the raw data from Kaggle
   - https://www.kaggle.com/datasets/residentmario/iowa-liquor-sales
4. Extract the Kaggle data file to <project-root>/database/Iowa_Liquor_Sales.csv

EXECUTION

In case of any challenges with building our project locally, we have also
hosted it on AWS at: http://team59.jhcao.net

The application is running on a t2.medium EC2 instance. If it is accessed
concurrently by multiple users, it could take some time for the server to
catch up. In testing, the server appears to perform decently well with up to
five concurrent users.

Enter the root directory and run: docker-compose up

- You may observe the docker logs to identify when the application is available
- The initial build in Postgres can take some time depending on your CPU. It
  loads our 3GB CSV file into Postgres and then reads/manipulates this data to
  create a second, larger table which is used by our machine learning service.
  - We saw the Postgres build take anywhere from 4 minutes up to 15 minutes
- The mlservice waits until Postgres is available
  - On first run it will take several minutes to build the Pickle files, again
    dependent on CPU speed
- The ui waits until mlservice is available
  - Once it's ready, a Docker log will show that the ui is available
- Open your web browser and navigate to: http://localhost:3000

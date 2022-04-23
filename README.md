# Environment Setup
## Requirements
- Docker: https://docs.docker.com/get-docker/
- Docker Compose: https://docs.docker.com/compose/install/
- All other dependencies are Dockerized, so you shouldn't need to install anything else manually
  - The quick start instructions below will:
    - Create all the requisite containers
    - Install dependencies
    - Load all of our data into an instance of PostgreSQL
- Once the class is done, you can simply remove the containers/images and no artifacts will be left on your system (other than Docker and Docker Compose)

## Quick start
- Extract data csv to `./database/Iowa_Liquor_Sales.csv`
- Run `docker-compose up --build`
  - First build will take some time to be available as Docker loads the 3.3GB of data into Postgres
  - Once the container and volumes are built, subsequent loads will be much faster
  - When the data is done loading, you'll see the following docker-compose log: `LOG:  database system is ready to accept connections`
    - On first build, `mlservice` will keep crashing and restarting until PG is up and accepting connections. There's probably a way to configure psycopg to wait and retry instead of crashing, but not sure it's worth spending time on that right now.
- To shut down the stack, use `docker-compose down`
  - To bring it back up, use `docker-compose up`

## Contributing
- Please do not commit directly to master!
- The following workflow will make it easy for us to revert code if needed
  - Create a new branch
  - Add your code
  - Submit a pull request
  - Squash and merge your own pull request
  - Delete the branch

# Container Notes

## ui
- Once the stack is up, you can view the ui in your browser at `localhost:3000`

## mlservice
- This is where the Python ML code will live
- Currently has Flask server running at port 4000

## pgAdmin
- Navigate your browser to `localhost:5050`
- Login credentials: `root@gatech.edu` / `root`
- `servers.json` automatically populates server connection settings
  - Once you're logged in, expand the "Servers" group
  - It will prompt you for a password; enter `root`
- pgAdmin provides an easy interface for browsing/querying the data

## FAQ

**How do I get a shell session into a running container?**

`docker exec -it [container_name] [shell]`

For containers which have bash (such as the Postgres container), this will work:
`docker exec -it database bash`

For containers which don't have bash, use:
`docker exec -it [container name] sh`

# Other Notes

## TODO
- ML
  - I haven't applied dimensionality reduction yet. It should improve the model performance once it is applied.
  - I haven't put any hyperparameter tuning yet.  It should improve the model performance once it is applied.
  - It is just linear regression. We can try other regression methods.
  - It predicts negative sales / profit. We should improve the model to avoid it.

## DONE
- Add UI hot reloading for faster development cycles
  - Flask
- Add Postgres Connector psycopg2
- Expose database port 5432
- Add sales_by_year API to return SQL results
- Add /eda/sales_by_year API to return Seaborn Image
- Add EDA Jupyter Notebook
- Add EDA Docker Compose
- Add Check Duplication SQL script in EDA
- Add PostGIS
- ETL
  - Summary
    - Deleted Rows: 92245 (0.73%)
    - Remaining Rows: 12498832 (99.27%)
    - Original Rows: 12591077
  - Transformation
    - Extract year from date
    - Extract month from date
    - Extract year-month from date
    - Extract day from date
    - Extract dow from date
    - Convert Store Name, Address, City, Store Location, County, Category Name, Vendor Name, Item Description to upper case
    - Convert Zip Code 712-2 to 51529
    - Remove $ from State Bottle Cost, State Bottle Retail, Sale (Dollars)
    - Convert all data type to proper format
  - Delete
    - Delete all rows is NULL
    - Delete all rows is 0
- Feature Engineering (One hot encoding & Pivot)
  - Create City by Store Number
  - Create Zip Code by Store Number
  - Create County Number by Store Number
  - Create Category by Store Number with Pivot
  - Create Vendor Number by Store Number with Pivot
  - Create Item Number by Store Number with Pivot
  - Create Average Monthly Pack by Store Number with Pivot
  - Create Average Monthly Bottle Volume in ML by Store Number with Pivot
  - Create Average Monthly Bottles Sold by Store Number with Pivot
  - Create Average Monthly Sales by Store Number with Pivot
  - Create Average Monthly Profit by Store Number with Pivot
  - Combine all the features based on store number
- ML
  - Add Kmeans clustering for store similarity (k=3)
    - Add mlservice/k_means.pkl
  - Add Linear Regression to predict store monthly sales
    - RMSE (Original): 23272.12673353224
    - RMSE (Cluster: 0): 11025.296839283432
    - RMSE (Cluster: 1): 5221.432212006931
    - RMSE (Cluster: 2): 8454.05534826173
    - RMSE (Cluster: Average): 8233.59479987
  - Add Linear Regression to predict store monthly profit
    - RMSE (Original): 21682.345592407626
    - RMSE (Cluster: 0): 3381.9545784247493
    - RMSE (Cluster: 1): 2957.6527283345645
    - RMSE (Cluster: 2): 8523.265087710313
    - RMSE (Cluster: Average): 4954.29079817
  - Predict Daily Sales by County
    - Add Sales Pickle Data
    - Add Random Forest Regression

## Credentials
- Database credentials are hard-coded and committed to the repository
  - We will need to change this policy if we deploy to the internet
    - Change credentials to something more secure
    - Manage credentials in a .env file instead of committing to the repo

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

# Other Notes

## TODO
- ML

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
    - Deleted Rows: 92245
    - Remaining Rows: 12498832
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

## Credentials
- Database credentials are hard-coded and committed to the repository
  - We will need to change this policy if we deploy to the internet
    - Change credentials to something more secure
    - Manage credentials in a .env file instead of committing to the repo

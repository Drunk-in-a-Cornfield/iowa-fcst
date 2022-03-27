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

## api
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
- add UI hot reloading for faster development cycles
- how to improve development cycle time for python api?

## Credentials
- Database credentials are hard-coded and committed to the repository
  - We will need to change this policy if we deploy to the internet
    - Change credentials to something more secure
    - Manage credentials in a .env file instead of committing to the repo

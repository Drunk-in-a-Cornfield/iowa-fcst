Quick start:
- Extract data csv to `./database/Iowa_Liquor_Sales.csv`
- Run `docker-compose up --build`
  - First build will take some time to be available as Docker loads the 3.3GB of data into Postgres
  - Once the container and volumes are built, subsequent loads will be much faster
  - When the data is done loading, you'll see the following docker-compose log: `LOG:  database system is ready to accept connections`
- To shut down the stack, use `docker-compose down`
  - To bring it back up, use `docker-compose up`

pgAdmin:
- Navigate your browser to `localhost:5050`
- Login credentials: `root@gatech.edu` / `root`
- `servers.json` automatically populates server connection settings
  - Once you're logged in, expand the "Servers" group
  - It will prompt you for a password; enter `root`
- pgAdmin provides an easy interface for browsing/querying the data


Development notes:
- Database credentials are hard-coded and committed to the repository
  - We will need to change this policy if we deploy to the internet
    - Change credentials to something more secure
    - Manage credentials in a .env file instead of committing to the repo

Quick start:
- Extract data csv to `./database/Iowa_Liquor_Sales.csv`
- Run `docker-compose up --build`

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

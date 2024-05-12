# README

This is a simple Rails app that gets current weather conditions as well as hourly and extended forecast by the supplied address. It uses weather.gov APIs and will cache conditions by ZIP code for 30 minutes. Development is done with Docker.

## Getting Started with Docker

1. Clone the repository

2. Build the Docker image

```bash
docker-compose build
```

3. Create the database

```bash
docker-compose run forecast rake db:create
```

4. Run the migrations

```bash
docker-compose run forecast rake db:migrate
```

5. Start the server

```bash
docker-compose up
```

6. Visit the site at [http://localhost:8010](http://localhost:8010)
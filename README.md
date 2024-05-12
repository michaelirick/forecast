# README

This is a simple Rails app that gets current weather conditions as well as hourly and extended forecast by the supplied address. It uses weather.gov APIs and will cache conditions by ZIP code for 30 minutes. Development is done with Docker.

## Getting Started with Docker

1. Install [Docker Desktop](https://www.docker.com/products/docker-desktop/)

2. Clone the repository

```bash
git clone ssh://git@github.com/michaelirick/forecast
```

3. Build the Docker image

```bash
docker-compose build
```

4. Create the database

```bash
docker-compose run forecast rake db:create
```

5. Run the migrations

```bash
docker-compose run forecast rake db:migrate
```

6. Start the server

```bash
docker-compose up
```

7. Visit the site at [http://localhost:8010](http://localhost:8010)

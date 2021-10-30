# README

This is a simple Rails app that gets current weather conditions as well as hourly and extended forecast by the supplied address. It uses weather.gov APIs and will cache conditions by ZIP code for 30 minutes.

## Getting Started

Clone the repository and install gems with bundler:

```
git clone ssh://git@github.com/michaelirick/forecast
cd forecast
bundle install
```

Configure your database `config/database.yml`

```
rails db:{create, migrate}
```

Run yarn, then launch the server

```
yarn
rails s
```

## Tests

Run test suite with:

```
rspec
```

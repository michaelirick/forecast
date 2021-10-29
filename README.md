# README

Get coords from address: https://geocoding.geo.census.gov/geocoder/locations/address?street=&city=&state=&zip=38053&benchmark=2020&format=json

get api details for https://api.weather.gov/points/39.7456,-97.0892:

    * https://api.weather.gov/gridpoints/TOP/31,80/forecast
    * hourly forecast: https://api.weather.gov/gridpoints/TOP/31,80/forecast/hourly

```
Location
  zip_code:string
  zone_coordinates:string
  latitude:string
  longitude:string

Forecast
  location_id:integer
  hourly:json
  extended:json
```

LocationService
ForecastService
HourlyForecastService
ExtendedForecastService
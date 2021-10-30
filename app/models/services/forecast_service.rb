module Services
  class ForecastService < Services::Base
    def run
      location = fetch_location

      return cached_forecast(location) unless location.forecast_expired?
      
      new_forecast location
    end

    def fetch_location
      Services::LocationService.new(params).run
    end

    def cached_forecast(location)
      {
        location: location,
        hourly: location.hourly_forecast,
        extended: location.extended_forecast,
        cached: true
      }
    end

    def new_forecast(location)
      hourly = Services::HourlyService.new(location: location).run
      extended = Services::HourlyService.new(location: location).run
      forecast = location.forecast
      forecast.update(hourly: hourly, extended: extended)

      {
        location: location,
        extended: extended,
        hourly: hourly,
        cached: false
      }      
    end
  end
end

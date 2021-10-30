# frozen_string_literal: true

module Services
  class ForecastService < Services::Base
    def run
      location = fetch_location
      # binding.pry
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
        cached: true,
        updated_at: location.location_forecast.updated_at
      }
    end

    def new_forecast(location)
      hourly = Services::HourlyService.new(location: location).run
      extended = Services::HourlyService.new(location: location).run
      forecast = location.forecast
      forecast.update(hourly: hourly, extended: extended, updated_at: Time.zone.now)

      {
        location: location,
        extended: extended,
        hourly: hourly,
        cached: false,
        updated_at: forecast.updated_at
      }
    end
  end
end

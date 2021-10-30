class Location < ApplicationRecord
  has_one :location_forecast

  def forecast_expired?
    return true unless location_forecast

    location_forecast.expired?
  end

  def hourly_forecast
    location_forecast&.hourly
  end

  def extended_forecast
    location_forecast&.extended
  end

  def forecast
    location_forecast || LocationForecast.create(location: self)
  end
end

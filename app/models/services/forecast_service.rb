module Services
  class ForecastService < Services::Base
    def run
      @location = fetch_location
      new_forecast
    end

    def fetch_location
      Services::LocationService.new(params).run
    end

    def new_forecast
      {
        location: @location,
        hourly: Services::HourlyService.new(location: @location).run,
        extended: Services::HourlyService.new(location: @location).run,
        cached: false
      }      
    end
  end
end

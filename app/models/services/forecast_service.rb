module Services
  class ForecastService < Services::Base
    def run
      {
        location: fetch_location,
        hourly: {yeet: :yote},
        extended: {yeet: :yote},
        cached: false
      }
    end

    def fetch_location
      Services::LocationService.new(params).run
    end
  end
end

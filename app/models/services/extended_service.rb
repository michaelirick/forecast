# frozen_string_literal: true

module Services
  class ExtendedService < Services::Base
    def run
      uri = URI("https://api.weather.gov/gridpoints/TOP/#{params[:location].zone_coordinates}/forecast")
      response = Net::HTTP.get_response uri

      result = JSON.parse(response.body)
    end
  end
end

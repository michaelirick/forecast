# frozen_string_literal: true

module Services
  class ZoneService < Services::Base
    def run
      uri = URI("https://api.weather.gov/points/#{params[:latitude].round(3)},#{params[:longitude].round(3)}")
      response = Net::HTTP.get_response uri

      result = JSON.parse(response.body)
      "#{result['properties']['gridX']},#{result['properties']['gridY']}"
    end
  end
end

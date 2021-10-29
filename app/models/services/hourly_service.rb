module Services
  class HourlyService < Services::Base
    def run
      uri = URI("https://api.weather.gov/gridpoints/TOP/#{params[:location].zone_coordinates}/forecast/hourly")
      response = Net::HTTP.get_response uri

      result = JSON.parse(response.body)
    end
  end
end

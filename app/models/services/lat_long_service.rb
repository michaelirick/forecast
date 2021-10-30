module Services
  class LatLongService < Services::Base
    def run
      uri = URI("https://geocoding.geo.census.gov/geocoder/locations/address")
      @params[:benchmark] = 2020
      @params[:format] = :json

      uri.query = URI.encode_www_form(params.to_hash)

      res = Net::HTTP.get_response(uri)
      
      unless res.is_a?(Net::HTTPSuccess)
        error = JSON.parse(res.body)
        throw error
      end
      
      result = JSON.parse(res.body)['result']     
      longitude, latitude = result['addressMatches'].first['coordinates'].slice('x', 'y').values
      
      {
        longitude: longitude,
        latitude: latitude
      }      
    end
  end
end
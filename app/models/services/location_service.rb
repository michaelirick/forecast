require 'pry'
module Services
  class LocationService < Services::Base
    def run
      uri = URI("https://geocoding.geo.census.gov/geocoder/locations/address")
      @params[:benchmark] = 2020
      @params[:format] = :json
      # params.to_hash.slice(
      #   :street, :city, :state, :zip, :benchmark, :format
      # ).reduce(:merge)
      uri.query = URI.encode_www_form(params.to_hash)

      res = Net::HTTP.get_response(uri)
      throw :error unless res.is_a?(Net::HTTPSuccess)
      
      result = JSON.parse(res.body)['result']
    end
  end
end

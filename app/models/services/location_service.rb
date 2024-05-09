# frozen_string_literal: true

module Services
  class LocationService < Services::Base
    def run
      location = Location.find_by zip_code: @params[:zip]

      location ||= fetch_location

      location
    end

    def fetch_location
      latlong = Services::LatLongService.new(params).run
      zone = Services::ZoneService.new(latlong).run

      Location.create(
        latlong.merge(zone_coordinates: zone, zip_code: @params[:zip])
      )
    end
  end
end

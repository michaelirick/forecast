require 'rails_helper'

RSpec.describe Services::ExtendedService, type: :model do
  let(:location_attributes) {{zip_code: '38105', zone_coordinates: '41,66', :latitude=>35.154575, :longitude=>-90.05245}}
  let(:location) { Location.create(location_attributes) }
  let(:service) { Services::ExtendedService.new(location: location) }

  it 'returns a forecast' do
    response = VCR.use_cassette('extended_service') do
      service.run
    end

    expect(response).to be_a Hash
  end

  it 'returns a forecast with the first period being Clear, windSpeed 5 to 10 mph, 45 F' do
    response = VCR.use_cassette('extended_service') do
      service.run
    end

    expect(response['properties']['periods'].first['shortForecast']).to eql 'Clear'
    expect(response['properties']['periods'].first['windSpeed']).to eql '5 to 10 mph'
    expect(response['properties']['periods'].first['temperature']).to eql 45
  end
end

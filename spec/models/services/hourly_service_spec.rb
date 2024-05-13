require 'rails_helper'

require 'pry'
RSpec.describe Services::HourlyService, type: :model do
  let(:location_attributes) {{zip_code: '38105', zone_coordinates: '42,67', :latitude=>35.15455, :longitude=>-90.05239}}
  let(:location) { Location.create(location_attributes) }
  let(:service) { Services::HourlyService.new(location: location) }

  it 'returns a forecast' do
    response = VCR.use_cassette('hourly_service') do
      service.run
    end

    # binding.pry
    expect(response).to be_a Hash
  end

  it 'returns a forecast with hourly data for 156 hours' do
    response = VCR.use_cassette('hourly_service') do
      service.run
    end

    expect(response['properties']['periods'].count).to eql 156
  end
end

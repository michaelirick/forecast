require 'rails_helper'

RSpec.describe Services::LocationService, type: :model do
  let(:params) { { street: '1 Bass Pro Drive', city: 'Memphis', state: 'TN', zip: 38105 } }
  let(:location_attributes) {{zip_code: '38105', zone_coordinates: '42,67', :latitude=>35.15455, :longitude=>-90.05239}}
  let(:memphis) { Location.new(location_attributes) }
  let(:service) { Services::LocationService.new(params) }

  it 'finds already created location from address params' do
    memphis.save
    expect(service.run.id).to eql memphis.id 
  end

  it 'creates a new location from address params' do
    expect(Location.find_by(location_attributes)).to eql nil
    VCR.use_cassette('zone_service') do
      VCR.use_cassette('lat_long_service') do
        service.run
      end
    end

    expect(Location.find_by(location_attributes)).to_not eql nil
  end

  it 'returns location from address params' do
    response = VCR.use_cassette('zone_service') do
      VCR.use_cassette('lat_long_service') do
        service.run
      end
    end
    expect(response).to eql Location.find_by(location_attributes)
  end
end

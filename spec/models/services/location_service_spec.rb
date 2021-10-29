require 'rails_helper'

RSpec.describe Services::LocationService, type: :model do
  let(:params) { { street: '1 Bass Pro Drive', city: 'Memphis', state: 'TN', zip: 38105 } }
  let(:location_attributes) {{zip_code: '38105', zone_coordinates: '41,66', :latitude=>35.154575, :longitude=>-90.05245}}
  let(:memphis) { Location.new(location_attributes) }
  let(:service) { Services::LocationService.new(params) }

  it 'finds already created location from address params' do
    memphis.save
    expect(service.run.id).to eql memphis.id 
  end

  it 'creates a new location from address params' do
    expect(Location.find_by(location_attributes)).to eql nil
    service.run
    expect(Location.find_by(location_attributes)).to_not eql nil
  end
end

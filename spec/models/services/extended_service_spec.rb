require 'rails_helper'

RSpec.describe Services::ExtendedService, type: :model do
  let(:location_attributes) {{zip_code: '38105', zone_coordinates: '41,66', :latitude=>35.154575, :longitude=>-90.05245}}
  let(:location) { Location.create(location_attributes) }
  let(:service) { Services::ExtendedService.new(location: location) }

  it 'returns a forecast' do
    expect(service.run).to_not eql nil
  end
end

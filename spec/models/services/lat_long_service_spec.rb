require 'rails_helper'

RSpec.describe Services::LatLongService, type: :model do
  let(:lat_long) { {:latitude=>35.154575, :longitude=>-90.05245} }
  let(:params) { { street: '1 Bass Pro Drive', city: 'Memphis', state: 'TN', zip: 38105 } }

  it 'returns lat/long from address' do
    expect(Services::LatLongService.new(params).run).to eql(lat_long)
  end
end

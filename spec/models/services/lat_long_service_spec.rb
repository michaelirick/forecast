require 'rails_helper'

RSpec.describe Services::LatLongService, type: :model do
  let(:lat_long) { {:latitude=>35.15455, :longitude=>-90.05239} }
  let(:params) { { street: '1 Bass Pro Drive', city: 'Memphis', state: 'TN', zip: 38105 } }

  it 'returns lat/long from address' do
    response = VCR.use_cassette('lat_long_service') do
      Services::LatLongService.new(params).run
    end

    expect(response).to eql lat_long
  end

  it 'returns latitude from address' do
    response = VCR.use_cassette('lat_long_service') do
      Services::LatLongService.new(params).run
    end

    expect(response[:latitude]).to eql 35.15455
  end

  it 'returns longitude from address' do
    response = VCR.use_cassette('lat_long_service') do
      Services::LatLongService.new(params).run
    end

    expect(response[:longitude]).to eql -90.05239
  end
end

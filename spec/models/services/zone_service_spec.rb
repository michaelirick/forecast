require 'rails_helper'

RSpec.describe Services::ZoneService, type: :model do
  let(:params) { {:latitude=>35.154575, :longitude=>-90.05245} }
  let(:zone) { '42,67' }

  it 'returns zone from lat/long' do
    response = VCR.use_cassette('zone_service') do
      Services::ZoneService.new(params).run
    end

    expect(response).to eql zone
  end
end

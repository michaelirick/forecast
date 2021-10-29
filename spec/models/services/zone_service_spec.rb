require 'rails_helper'

RSpec.describe Services::ZoneService, type: :model do
  let(:params) { {:latitude=>35.154575, :longitude=>-90.05245} }
  let(:zone) { '41,66' }

  it 'returns zone from lat/long' do
    expect(Services::ZoneService.new(params).run).to eql(zone)
  end
end

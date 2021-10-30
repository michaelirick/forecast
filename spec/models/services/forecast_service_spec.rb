require 'rails_helper'

RSpec.describe Services::ForecastService, type: :model do
  let(:params) { { street: '1 Bass Pro Drive', city: 'Memphis', state: 'TN', zip: 38105 } }
  let(:service) { Services::ForecastService.new(params) }
  let(:location_attributes) {{zip_code: '38105', zone_coordinates: '41,66', :latitude=>35.154575, :longitude=>-90.05245}}

  it 'returns a forecast' do
    expect(service.run).to_not eql nil
  end

  it 'returns new forecast if more than 30 minutes old' do
    forecast = service.run
    Location.connection.execute("UPDATE location_forecasts SET updated_at = '#{31.minutes.ago}' WHERE id = #{forecast[:location].forecast.id}")
    expect(service.run[:cached]).to eql false
  end

  it 'returns cached forecast if less than 30 minutes old' do
    service.run
    expect(service.run[:cached]).to eql true
  end  
end

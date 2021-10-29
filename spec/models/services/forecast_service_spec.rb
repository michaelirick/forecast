require 'rails_helper'

RSpec.describe Services::ForecastService, type: :model do
  let(:params) { { street: '1 Bass Pro Drive', city: 'Memphis', state: 'TN', zip: 38105 } }
  let(:service) { Services::ForecastService.new(params) }
  it 'returns a forecast' do
    expect(service.run).to_not eql nil
  end
end

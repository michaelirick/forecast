require 'rails_helper'

RSpec.describe LocationForecast, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  let(:location) { Location.create }
  let(:expired_forecast) { LocationForecast.create(location: location, updated_at: 31.minutes.ago) }
  let(:unexpired_forecast) { LocationForecast.create(location: location, updated_at: 29.minutes.ago) }

  it 'is expired after 30 minutes' do
    expect(expired_forecast.expired?).to eql(true)
  end

  it 'is not expired before 30 minutes' do
    expect(unexpired_forecast.expired?).to eql(false)
  end  
end

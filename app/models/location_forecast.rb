class LocationForecast < ApplicationRecord
  belongs_to :location

  def expired?
    updated_at < 30.minutes.ago
  end
end

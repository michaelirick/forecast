class CreateLocationForecasts < ActiveRecord::Migration[6.1]
  def change
    create_table :location_forecasts do |t|
      t.integer :location_id
      t.jsonb :hourly
      t.jsonb :extended

      t.timestamps
    end
  end
end

class ForecastController < ApplicationController
  def index
  end

  def forecast
    @location, @hourly, @extended, @cached = Services::ForecastService.new(forecast_params)
      .run
      .slice(:location, :hourly, :extended, :cached)
      .values
  end

  private

  def forecast_params
    params.permit(:street, :city, :state, :zip)
  end
end

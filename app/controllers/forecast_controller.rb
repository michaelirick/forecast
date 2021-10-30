class ForecastController < ApplicationController
  def index
    @params = forecast_params
  end

  def forecast
    @params = forecast_params
    @location, @hourly, @extended, @cached, @updated_at = Services::ForecastService.new(forecast_params)
      .run
      .slice(:location, :hourly, :extended, :cached, :updated_at)
      .values
  end

  private

  def forecast_params
    params.permit(:street, :city, :state, :zip)
  end
end

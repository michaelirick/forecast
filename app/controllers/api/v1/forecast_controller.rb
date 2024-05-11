# frozen_string_literal: true

module Api
  module V1
    class ForecastController < ApplicationController
      def forecast
        @params = forecast_params
        @location, @hourly, @extended, @cached, @updated_at = Services::ForecastService.new(forecast_params)
                                                                                      .run
                                                                                      .slice(:location, :hourly, :extended, :cached, :updated_at)
                                                                                      .values
        render json: { location: @location, hourly: @hourly, extended: @extended, cached: @cached, updated_at: @updated_at }                                                                                   
      end

      private

      def forecast_params
        params.permit(:street, :city, :state, :zip)
      end
    end
  end
end

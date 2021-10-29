Rails.application.routes.draw do
  # post 'forecast/forecast', as: :get_forecast
  # get 'forecast#index', as: :forecast_index

  root to: 'forecast#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

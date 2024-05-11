Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'forecast', action: 'forecast', controller: 'forecast'
    end
  end
  root to: 'forecast#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

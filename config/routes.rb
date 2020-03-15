Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/v1/auth'

  root to: 'application#emptypage'

  namespace :api do
    namespace :v1 do
      resources :customers
      resources :races do
        resources :reports
      end
      resources :drivers
      resources :cars

      get 'reports', to: 'reports#user_reports'
      get 'search_cars_by_driver', to: 'races#search_cars_by_driver'
    end
  end
end

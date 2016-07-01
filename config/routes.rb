Rails.application.routes.draw do
  resources :access_points
  devise_for :users, defaults: {format: :json}
  resources :zones, defaults: {format: :json}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :facilities
  devise_for :users
  resources :zones
  resources :points
  resources :measures
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end

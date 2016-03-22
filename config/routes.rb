Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  get '/facilities/:user_id', to: 'facilities#index'
  post '/facilities', to: 'facilities#create'

  get '/zones/:facility_id', to: 'zones#index'
  post '/zones', to: 'zones#create'

  resources :zones
  resources :points
  resources :measures

  get '/test', to: 'test#user_facilities'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end

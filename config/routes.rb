Rails.application.routes.draw do

  get '/facilities/:user_id', to: 'facilities#index'
  post '/facilities', to: 'facilities#create'

  devise_for :users
  resources :zones
  resources :points
  resources :measures

  get '/test', to: 'test#user_facilities'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end

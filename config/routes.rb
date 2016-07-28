Rails.application.routes.draw do

  devise_for :users, defaults: {format: :json}

  post '/create_facility', to: 'facilities#create_facility', defaults: {format: :json}
  get '/facilities', to: 'facilities#show_all', defaults: {format: :json}

  post '/create_zone', to: 'zones#create_zone', defaults: {format: :json}
  get '/zones', to: 'zones#show_all', defaults: {format: :json}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

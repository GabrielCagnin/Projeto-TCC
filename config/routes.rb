Rails.application.routes.draw do

  devise_for :users, defaults: {format: :json}

  post '/create_facility', to: 'facilities#create_facility', defaults: {format: :json}
  get '/facilities', to: 'facilities#show_all', defaults: {format: :json}

  post '/create_zone', to: 'zones#create_zone', defaults: {format: :json}
  get '/zones', to: 'zones#show_all', defaults: {format: :json}

  post '/create_acquisition_set', to: 'acquisition_set#create_set', defaults: {format: :json}
  get '/acquisition_set', to: 'acquisition_set#show', defaults: {format: :json}

  get '/acquisition', to: 'acquisition#show', defaults: {format: :json}

  # Shows all acquisitions from a zone passed as parameter
  get '/acquisitions', to: 'acquisition#show_all', defaults: {format: :json}

end

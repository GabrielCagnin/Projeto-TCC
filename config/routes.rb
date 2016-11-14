Rails.application.routes.draw do

  devise_for :users, defaults: {format: :json}

  post '/create_facility', to: 'facilities#create_facility', defaults: {format: :json}
  get '/facilities', to: 'facilities#show_all', defaults: {format: :json}

  post '/create_zone', to: 'zones#create_zone', defaults: {format: :json}
  get '/zones', to: 'zones#show_all', defaults: {format: :json}

  post '/create_acquisition_set', to: 'acquisition_sets#create_set', defaults: {format: :json}
  get '/acquisition_set', to: 'acquisition_set#show_all', defaults: {format: :json}

  # Shows all access points from an acquisition passed as parameter
  get '/access_points', to: 'access_points#show_all', defaults: {format: :json}

  # Shows all acquisitions from a zone OR acquisition set passed as parameter
  get '/acquisitions', to: 'acquisitions#show_all', defaults: {format: :json}

  # Train a facility
  get '/train_facility', to: 'classify_zone#train_facility', defaults: {format: :json}

  # Identify a zone
  post '/identify_zone', to: 'classify_zone#identify_zone', defaults: {format: :json}

  delete '/delete_facility', to: 'facilities#delete_facility', defaults: {format: :json}

  delete '/delete_zone', to: 'zones#delete_zone', defaults: {format: :json}

  get '/clear_zone', to: 'zones#clear_zone', defaults: {format: :json}


end

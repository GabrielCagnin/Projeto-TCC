Rails.application.routes.draw do

  get 'classify_zone/getZone'

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

  # Enqueues acquistion in the database
  post '/classify_zone', to: 'enqueued_classification_request#enqueue_acquisition', defaults: {format: :json}

end

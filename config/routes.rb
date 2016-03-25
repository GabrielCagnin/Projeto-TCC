Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  get '/facilities/user/:user_id', to: 'facilities#show_user_facilities'
  post '/facilities', to: 'facilities#create'

  get '/zones/facility/:facility_id', to: 'zones#show_facility_zones'
  post '/zones', to: 'zones#create'

  get '/points/zone/:zone_id', to: 'points#show_zone_points'
  post '/points', to: 'points#create'

  get '/measures/point/:point_id', to: 'measures#show_point_measures'
  post '/measures', to: 'measures#create'

  get '/test', to: 'test#user_facilities'
end

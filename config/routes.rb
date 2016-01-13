Rails.application.routes.draw do
  post '/register' => 'auth#register'
  post '/login' => 'auth#login'
  delete '/logout/:id' => 'auth#logout'


  resources :users, except: [:new, :edit] do
    resource :profile, shallow: true
  end

  resource :profile, except: [:new, :edit, :index, :create] do
    resources :weather_pairs, shallow: true
  end

  resource :track, only: [:index]
  # get '/current' => 'weather_pairs#genre_by_weather'
  get '/current' => 'external_api#current'
  get '/track' => 'external_api#track'

end

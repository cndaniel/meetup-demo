Rails.application.routes.draw do
  devise_for :users
  resources :meetups, only: [:index, :show, :create, :new] do
    resources :comments, only: :create
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/signup' => 'auth#signup'
      post '/login' => 'auth#login'
      post '/logout' => 'auth#logout'
      get '/meetups/:meetup_id' => 'meetups#show', as: :meetup
      get '/meetups' => 'meetups#index', as: :meetups
    end
  end

  root 'meetups#index'
end

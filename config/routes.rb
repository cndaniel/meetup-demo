Rails.application.routes.draw do
  devise_for :users
  resources :meetups, only: [:index, :show, :create, :new]
  root "meetups#index"
end

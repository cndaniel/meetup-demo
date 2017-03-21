Rails.application.routes.draw do
  resources :meetups, only: [:index, :show, :create, :new]
  root "meetups#index"
end

Rails.application.routes.draw do
  resources :meetups, only: [:index, :show]
end
